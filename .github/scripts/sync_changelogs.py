import re
from pathlib import Path

def release_span(content, version):
    headings = list(re.finditer(r"^##[ \t]+(.+)$", content, re.M))
    pattern = rf"(?:\[{re.escape(version)}\]|{re.escape(version)})(?=\s|\(|$)"

    for index, heading in enumerate(headings):
        if re.match(pattern, heading.group(1)):
            end = (
                headings[index + 1].start()
                if index + 1 < len(headings)
                else len(content)
            )

            return heading.start(), end

    return None

def sync_changelogs(root):
    version = (root / "version.txt").read_text().strip()
    workspace = (root / "CHANGELOG.md").read_text()
    span = release_span(workspace, version)

    if span is None:
        raise ValueError(f"Workspace changelog has no entry for {version}")

    entry = workspace[span[0]:span[1]].strip()

    for path in sorted(root.glob("packages/*/CHANGELOG.md")):
        history = path.read_text()
        existing = release_span(history, version)

        if existing is not None:
            history = history[:existing[0]] + history[existing[1]:]

        first_release = re.search(r"^##[ \t]+", history, re.M)
        offset = first_release.start() if first_release else len(history)
        prefix = history[:offset].rstrip()
        suffix = history[offset:]
        introduction = prefix + "\n\n" if prefix else ""
        separator = "\n\n" if suffix else "\n"
        path.write_text(introduction + entry + separator + suffix)

if __name__ == "__main__":
    sync_changelogs(Path(__file__).resolve().parents[2])
