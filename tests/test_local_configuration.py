"""Portable path precedence and rejection of mismatched original game files."""
from hashlib import sha256
from pathlib import Path
import os
import sys
import tempfile
import unittest
from unittest.mock import patch

sys.path.insert(0, str(Path(__file__).resolve().parents[1]/'tools'))
import project_model
from import_originals import validate_original


class LocalConfigurationTests(unittest.TestCase):
    def test_environment_overrides_local_configuration(self):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            with patch.object(project_model, 'ROOT', root), patch.object(project_model, 'local_settings', return_value={'materials_dir': 'configured'}), patch.dict(os.environ, {'RD_MATERIALS_DIR': 'environment'}):
                self.assertEqual(project_model.original_materials_dir(), (root/'environment').resolve())

    def test_relative_reference_path_is_rooted_in_checkout(self):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            with patch.object(project_model, 'ROOT', root), patch.object(project_model, 'local_settings', return_value={'reference_dir': 'private/baseline'}), patch.dict(os.environ, {}, clear=True):
                self.assertEqual(project_model.snapshot_directory(), (root/'private/baseline').resolve())

    def test_wrong_version_original_is_rejected_before_parsing(self):
        with tempfile.TemporaryDirectory() as directory:
            file = Path(directory)/'Example.material.bin'
            file.write_bytes(b'different-game-build')
            with self.assertRaisesRegex(ValueError, 'supported game build'):
                validate_original(file, sha256(b'expected-game-build').hexdigest())
            self.assertEqual(validate_original(file, sha256(file.read_bytes()).hexdigest()), b'different-game-build')


if __name__ == '__main__':
    unittest.main()
