import tempfile
import unittest
from pathlib import Path

from sync_changelogs import sync_changelogs

class SyncChangelogsTest(unittest.TestCase):
    def test_prepends_only_current_release_and_preserves_package_history(self):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            (root / "version.txt").write_text("0.2.1\n")
            (root / "CHANGELOG.md").write_text(
                "# Workspace changes\n\n"
                "## [0.2.1](https://example.com/release) (2026-11-06)\n\n"
                "### Fixes\n\n* Current fix.\n\n"
                "## 0.2.0\n\n* Unrelated workspace history.\n"
            )
            histories = {
                "first": "## 0.1.9\n\n* First package history.\n",
                "second": (
                    "# Changes\n\n## 0.1.3\n\n* Second package history.\n"
                ),
            }

            for name, history in histories.items():
                path = root / "packages" / name / "CHANGELOG.md"
                path.parent.mkdir(parents=True)
                path.write_text(history)

            sync_changelogs(root)
            first_result = {}

            for name, history in histories.items():
                path = root / "packages" / name / "CHANGELOG.md"
                actual = path.read_text()
                self.assertIn("### Fixes\n\n* Current fix.", actual)
                self.assertNotIn("Unrelated workspace history", actual)
                self.assertIn(
                    history[history.index("## "):],
                    actual,
                )
                self.assertEqual(actual.count("## [0.2.1]"), 1)
                first_result[name] = actual

            sync_changelogs(root)

            for name, expected in first_result.items():
                actual = (root / "packages" / name / "CHANGELOG.md").read_text()
                self.assertEqual(actual, expected)

    def test_missing_release_does_not_modify_package_history(self):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            (root / "version.txt").write_text("0.2.1\n")
            (root / "CHANGELOG.md").write_text(
                "## 0.2.0\n\n* Previous release.\n"
            )
            path = root / "packages" / "example" / "CHANGELOG.md"
            path.parent.mkdir(parents=True)
            original = "## 0.1.0\n\n* Original history.\n"
            path.write_text(original)

            with self.assertRaisesRegex(ValueError, "no entry for 0.2.1"):
                sync_changelogs(root)

            self.assertEqual(path.read_text(), original)

if __name__ == "__main__":
    unittest.main()
