"""Regressions for widened private outputs and original public stage packing."""
import sys
from pathlib import Path
import unittest

sys.path.insert(0, str(Path(__file__).resolve().parents[1]/'tools'))
from native_abi import adapt


class NativeEntryTests(unittest.TestCase):
    def test_narrow_public_uv_keeps_private_padding_defined(self):
        source = '''#line 1 "private.hlsl"
void main(float3 position : POSITION0, out float4 projected : SV_Position0,
          out float4 coordinates : TEXCOORD0) {
    projected = float4(position, 1); coordinates.xy = position.xy;
}\0'''
        contract = {
            'input': [{'semantic': 'POSITION', 'index': 0, 'type': 3, 'mask': 7, 'register': 0}],
            'output': [{'semantic': 'SV_POSITION', 'index': 0, 'type': 3, 'mask': 15, 'register': 0},
                       {'semantic': 'TEXCOORD', 'index': 0, 'type': 3, 'mask': 3, 'register': 1}]}
        generated = adapt(source, contract, 'vertex')
        self.assertNotIn('\0', generated)
        self.assertNotIn('#line', generated)
        self.assertIn('inout float4 coordinates', generated)
        self.assertIn('float2 texcoord0 : TEXCOORD0;', generated)
        self.assertIn('float4 coordinates = 0;', generated)
        self.assertLess(generated.index('sv_position0 :'), generated.index('texcoord0 :'))

    def test_unused_original_input_is_retained(self):
        source = 'float4 main(float2 uv : TEXCOORD0) : SV_Target0 { return float4(uv, 0, 1); }'
        contract = {'input': [{'semantic': 'SV_POSITION', 'index': 0, 'type': 3, 'mask': 15, 'register': 0},
                              {'semantic': 'TEXCOORD', 'index': 0, 'type': 3, 'mask': 3, 'register': 1}],
                    'output': [{'semantic': 'SV_TARGET', 'index': 0, 'type': 3, 'mask': 15, 'register': 0}]}
        generated = adapt(source, contract, 'fragment')
        self.assertIn('float4 sv_position0 : SV_POSITION0;', generated)
        self.assertIn('rdNativeKernel((float2)(nativeInput.texcoord0))', generated)


if __name__ == '__main__':
    unittest.main()
