#!/bin/sh
swaymsg bar bar-0 hidden_state show > /dev/null

pidfile="${XDG_RUNTIME_DIR:-/tmp}/waybar-reveal.pid"
if [ -f "$pidfile" ]; then
    kill "$(cat "$pidfile")" 2>/dev/null || true
fi

emptyfile="${XDG_RUNTIME_DIR:-/tmp}/waybar-empty-workspace"
( sleep 1; if [ "$(cat "$emptyfile" 2>/dev/null)" != "1" ]; then swaymsg bar bar-0 hidden_state hide > /dev/null; fi ) &
echo $! > "$pidfile"
