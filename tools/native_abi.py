"""Emit an HLSL entry adapter with the original Direct3D signature packing.

The editable kernels keep their convenient intermediate vectors. The public
native entry uses the original semantic order and component widths, including
unused fields, so that independently compiled stages remain link-compatible.
"""
import re

VERSION = 1
FIELD = re.compile(r'(?P<qual>(?:(?:centroid|nointerpolation|noperspective|sample|linear)\s+)*)'
                   r'(?P<type>(?:float|half|double|int|uint|bool)(?:[1-4])?)\s+'
                   r'(?P<name>\w+)\s*:\s*(?P<semantic>[A-Za-z_]\w*)')


def semantic_key(value):
    match = re.fullmatch(r'([A-Za-z_]+?)(\d*)', value)
    return match[1].upper(), int(match[2] or 0)


def width(type_name):
    return int(type_name[-1]) if type_name[-1].isdigit() else 1


def convert(expression, from_type, to_type):
    a, b = width(from_type), width(to_type)
    if a > b:
        expression = '(' + expression + ').' + 'xyzw'[:b]
    elif a < b:
        expression = to_type + '(' + expression + ', ' + ', '.join('0' for _ in range(b-a)) + ')'
    return '(' + to_type + ')(' + expression + ')'


def adapt(text, contract, stage):
    text = text.replace('\0', '')
    if stage == 'compute':
        return text
    text = re.sub(r'^\s*#line.*$', '', text, flags=re.M)
    structures = {}
    for match in re.finditer(r'\bstruct\s+(\w+)\s*\{(.*?)\}\s*;', text, re.S):
        structures[match[1]] = [m.groupdict() for m in FIELD.finditer(match[2])]
    entry = re.search(r'\b(\w+)\s+main\s*\(', text)
    if not entry:
        raise ValueError('Native HLSL entry point was not found.')
    start, depth, end = entry.end(), 1, entry.end()
    while depth:
        if text[end] == '(':
            depth += 1
        elif text[end] == ')':
            depth -= 1
        end += 1
    arguments = []
    inputs, outputs = {}, {}
    for parameter in text[start:end-1].split(','):
        parameter = parameter.strip()
        if not parameter or parameter == 'void':
            continue
        field = FIELD.search(parameter)
        if field:
            field = field.groupdict()
            field['kind'] = 'output' if re.search(r'\bout\b', parameter) else 'input'
            arguments.append(field)
            (outputs if field['kind'] == 'output' else inputs)[semantic_key(field['semantic'])] = field
        else:
            parameter = re.sub(r'\b(?:in|const)\b', '', parameter).split()
            if len(parameter) != 2 or parameter[0] not in structures:
                raise ValueError('Unsupported native entry argument: ' + str(parameter))
            argument = {'kind': 'struct', 'type': parameter[0], 'name': parameter[1]}
            arguments.append(argument)
            for field in structures[argument['type']]:
                field = {**field, 'argument': argument['name']}
                inputs[semantic_key(field['semantic'])] = field
    return_type = entry[1]
    if return_type in structures:
        for field in structures[return_type]:
            outputs[semantic_key(field['semantic'])] = {**field, 'return_field': True}
    elif return_type != 'void':
        # A direct scalar/vector return may carry an output semantic.
        trailing = re.match(r'\s*:\s*([A-Za-z_]\w*)', text[end:])
        if not trailing:
            raise ValueError('Unsupported native return type: ' + return_type)
        outputs[semantic_key(trailing[1])] = {'type': return_type, 'name': 'nativeResult', 'qual': '', 'return_value': True}
    native = {}
    for direction, old in (('input', inputs), ('output', outputs)):
        rows = sorted(contract[direction], key=lambda r: (r['register'], (r['mask'] & -r['mask']).bit_length()))
        fields = []
        for row in rows:
            key = row['semantic'], row['index']
            original = old.get(key)
            scalar = {1: 'uint', 2: 'int', 3: 'float'}[row['type']]
            components = row['mask'].bit_count()
            typename = scalar + (str(components) if components > 1 else '')
            qualifier = contract.get('qualifiers', {}).get(direction, {}).get(
                row['semantic']+':'+str(row['index']), original.get('qual', '') if original else '')
            if stage == 'fragment' and direction == 'input' and scalar in ('int', 'uint'):
                qualifier = 'nointerpolation '
            name = re.sub(r'[^A-Za-z0-9_]', '', row['semantic'].lower()) + str(row['index'])
            fields.append({'key': key, 'type': typename, 'name': name, 'qual': qualifier,
                           'semantic': row['semantic'] + str(row['index'])})
        native[direction] = fields
    lines = ['\n// Original native ABI: declaration order also determines packed register lanes.']
    for direction in ('input', 'output'):
        if native[direction]:
            lines += ['struct Native' + direction.title(), '{']
            lines += ['    {qual}{type} {name} : {semantic};'.format(**f) for f in native[direction]]
            lines += ['};']
    lines.append(('NativeOutput' if native['output'] else 'void') + ' main(' +
                 ('NativeInput nativeInput' if native['input'] else '') + ')\n{')
    native_inputs = {f['key']: f for f in native['input']}
    call = []
    for arg in arguments:
        if arg['kind'] == 'struct':
            lines.append('    ' + arg['type'] + ' ' + arg['name'] + ' = (' + arg['type'] + ')0;')
            for field in structures[arg['type']]:
                n = native_inputs.get(semantic_key(field['semantic']))
                if n:
                    lines.append('    ' + arg['name'] + '.' + field['name'] + ' = ' + convert('nativeInput.'+n['name'], n['type'], field['type']) + ';')
            call.append(arg['name'])
        elif arg['kind'] == 'input':
            n = native_inputs.get(semantic_key(arg['semantic']))
            call.append(convert('nativeInput.'+n['name'], n['type'], arg['type']) if n else '('+arg['type']+')0')
        else:
            lines.append('    ' + arg['type'] + ' ' + arg['name'] + ' = 0;')
            call.append(arg['name'])
    invocation = 'rdNativeKernel(' + ', '.join(call) + ')'
    lines.append('    ' + (return_type+' nativeResult = ' if return_type != 'void' else '') + invocation + ';')
    if native['output']:
        lines.append('    NativeOutput nativeOutput = (NativeOutput)0;')
        for n in native['output']:
            field = outputs.get(n['key'])
            if field:
                expression = 'nativeResult.'+field['name'] if field.get('return_field') else 'nativeResult' if field.get('return_value') else field['name']
                lines.append('    nativeOutput.'+n['name']+' = '+convert(expression,field['type'],n['type'])+';')
        lines.append('    return nativeOutput;')
    lines.append('}')
    # Legacy decompilers widened a few output parameters while only assigning
    # their live lanes. Inout locals preserve defined adapter padding without
    # requiring the widened, private function outputs to be fully overwritten.
    private_header = text[entry.start():end].replace('main', 'rdNativeKernel', 1)
    private_header = re.sub(r'\bout\b', 'inout', private_header)
    return text[:entry.start()] + private_header + text[end:] + '\n'.join(lines) + '\n'
