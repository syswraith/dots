#!/usr/bin/env python3
import json
import os
import signal
import subprocess
from pathlib import Path

RUNTIME = Path(os.environ.get("XDG_RUNTIME_DIR", "/tmp"))
STATE_FILE = RUNTIME / "waybar-empty-workspace"
PID_FILE = RUNTIME / "bar-workspace-watch.pid"


def sway(*args):
    return subprocess.check_output(["swaymsg", "-t", *args], text=True)


def count_windows(node):
    total = 0
    for child in node.get("nodes", []) + node.get("floating_nodes", []):
        if (
            child.get("window") is not None
            or child.get("foreign_toplevel_identifier") is not None
            or child.get("pid") is not None
        ):
            total += 1
        total += count_windows(child)
    return total


def current_workspace_empty():
    tree = json.loads(sway("get_tree"))
    outputs = json.loads(sway("get_outputs"))
    workspaces = []

    def collect(node):
        if node.get("type") == "workspace":
            workspaces.append(node)
        for child in node.get("nodes", []) + node.get("floating_nodes", []):
            collect(child)

    collect(tree)
    for output in outputs:
        if not output.get("active"):
            continue
        name = output.get("current_workspace")
        if not name:
            continue
        workspace = next((w for w in workspaces if w.get("name") == name), None)
        if workspace is not None and count_windows(workspace) == 0:
            return True
    return False


def acquire_lock():
    if PID_FILE.exists():
        try:
            pid = int(PID_FILE.read_text().strip())
            os.kill(pid, signal.SIGTERM)
        except (ValueError, ProcessLookupError, OSError):
            pass
    PID_FILE.write_text(str(os.getpid()))


def main():
    acquire_lock()

    previous = None
    subscription = None

    empty = current_workspace_empty()
    STATE_FILE.write_text("1" if empty else "0")
    subprocess.run(
        ["swaymsg", "bar", "bar-0", "hidden_state", "show" if empty else "hide"],
        stdout=subprocess.DEVNULL,
    )
    previous = empty

    while True:
        if subscription is None or subscription.poll() is not None:
            subscription = subprocess.Popen(
                ["swaymsg", "-t", "subscribe", '["workspace","window","output"]'],
                stdout=subprocess.PIPE,
                text=True,
            )
        if subscription.stdout.readline() == "":
            subscription = None
            continue

        empty = current_workspace_empty()
        if empty == previous:
            continue

        STATE_FILE.write_text("1" if empty else "0")
        subprocess.run(
            ["swaymsg", "bar", "bar-0", "hidden_state", "show" if empty else "hide"],
            stdout=subprocess.DEVNULL,
        )
        previous = empty


if __name__ == "__main__":
    main()
