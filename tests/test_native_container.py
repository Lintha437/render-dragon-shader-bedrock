"""Binary fixtures cover exact masks and actual shader model profile decoding."""
import struct
from pathlib import Path
import sys
import unittest

sys.path.insert(0, str(Path(__file__).resolve().parents[1]/'tools'))
from audit_native_interfaces import signatures
from pack_materials import native_profile


def container(tag, payload):
    chunk = tag+struct.pack('<I', len(payload))+payload
    return b'DXBC'+bytes(16)+struct.pack('<III', 1, 36+len(chunk), 1)+struct.pack('<I', 36)+chunk


class NativeContainerTests(unittest.TestCase):
    def test_component_lanes_are_not_reduced_to_component_count(self):
        name = b'TEXCOORD\0'
        payload = struct.pack('<II', 1, 8)+struct.pack('<5IBBH', 32, 5, 0, 3, 6, 12, 12, 0)+name
        row = signatures(container(b'ISGN', payload))['input'][0]
        self.assertEqual((row['semantic'], row['index'], row['register'], row['mask']), ('TEXCOORD', 5, 6, 12))
        self.assertNotEqual(row['mask'], 3)

    def test_backend_label_does_not_replace_native_profile(self):
        self.assertEqual(native_profile(container(b'DXIL', struct.pack('<I', (5 << 16) | (6 << 4) | 3))), 'cs_6_3')
        self.assertEqual(native_profile(container(b'SHDR', struct.pack('<I', (1 << 16) | (4 << 4)))), 'vs_4_0')


if __name__ == '__main__':
    unittest.main()
