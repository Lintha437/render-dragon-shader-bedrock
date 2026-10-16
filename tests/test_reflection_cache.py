"""Concurrent equal binaries must share a complete, single-writer reflection."""
from concurrent.futures import ThreadPoolExecutor
from pathlib import Path
import sys
import tempfile
from types import SimpleNamespace
import unittest
from unittest.mock import patch

sys.path.insert(0, str(Path(__file__).resolve().parents[1]/'tools'))
import audit_runtime_contracts as audit


class ReflectionCacheTests(unittest.TestCase):
    def test_equal_binaries_compile_reflection_once(self):
        with tempfile.TemporaryDirectory() as directory:
            result = SimpleNamespace(returncode=0, stdout=b'; Resource Bindings:\n; complete reflection\n', stderr=b'')
            with patch.object(audit, 'ROOT', Path(directory)), patch.object(audit, 'locate', return_value=Path('dxc')), patch.object(audit.subprocess, 'run', return_value=result) as compiler:
                with ThreadPoolExecutor(max_workers=8) as pool:
                    values = list(pool.map(lambda _: audit.reflection_text(Path('program.dxil'), True, 'identical'), range(24)))
                self.assertEqual(compiler.call_count, 1)
                self.assertEqual(values, [result.stdout.decode()]*24)
                self.assertFalse((Path(directory)/'build/runtime_reflection/identical.tmp').exists())


if __name__ == '__main__':
    unittest.main()
