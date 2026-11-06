import json
import os
import re
import subprocess
from pathlib import Path

root = Path(__file__).resolve().parents[2]
version = (root / "version.txt").read_text().strip()
manifest = json.loads((root / ".release-please-manifest.json").read_text())

if not re.fullmatch(r"\d+\.\d+\.\d+(?:-[\w.-]+)?(?:\+[\w.-]+)?", version):
    raise SystemExit(f"Invalid release version: {version}")

if manifest.get(".") != version:
    raise SystemExit("Release manifest and version.txt disagree")

if os.environ.get("GITHUB_REF_TYPE") == "tag":
    if os.environ.get("GITHUB_REF_NAME") != f"v{version}":
        raise SystemExit(f"Expected release tag v{version}")

packages = json.loads(
    subprocess.check_output(
        ["dart", "run", "melos", "list", "--json"],
        cwd=root,
        text=True,
    )
)
public = {package["name"] for package in packages if not package["private"]}

if not public:
    raise SystemExit("No publishable packages found")

for package in packages:
    if not package["private"] and package["version"] != version:
        raise SystemExit(f"{package['name']} must use release version {version}")

    pubspec = (Path(package["location"]) / "pubspec.yaml").read_text()
    dependencies = re.findall(
        r"^  (\w+):[ \t]*([^\n]+)",
        pubspec,
        re.M,
    )

    for name, constraint in dependencies:
        if name in public and constraint.split("#", 1)[0].strip() != f"^{version}":
            raise SystemExit(f"{package['name']}: {name} must use ^{version}")

print(f"Validated {len(public)} packages for release {version}")
