#!/usr/bin/env bash

if [ -z "$1" ]; then
    echo "[Error]:: Name of script is required"
    echo "[Use]:: > $0 <name-of-script>"
    exit 1
fi

PATH_SCRIPT="$HOME/Documents/projects/my-scripts/automations/$1"
PATH_BIN="/usr/bin/$1"

if [ ! -f "$PATH_SCRIPT" ]; then
    echo "[Error]:: Script not found"
    exit 1
fi

if [ -f "$PATH_BIN" ]; then
    sudo rm "$PATH_BIN"
fi

if [ "$(stat -c %a "$PATH_SCRIPT")" != "777" ]; then
    sudo chmod 777 "$PATH_SCRIPT"
fi

if [ "$(stat -c %a "$PATH_SCRIPT")" != "777" ]; then
    echo "[Error]:: Failed to change permissions"
    exit 1
fi

sudo cp "$PATH_SCRIPT" "$PATH_BIN"
