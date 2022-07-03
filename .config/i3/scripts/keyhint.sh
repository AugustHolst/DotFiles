#!/bin/bash

Main() {
    source /usr/share/endeavouros/scripts/eos-script-lib-yad || return 1

    local command=(
        eos_yad --title="EndeavourOS i3-wm keybindings:" --no-buttons --geometry=400x345-15-400 --list
        --column=key: --column=description: --column=command:
        "ESC" "close this app" ""
        "=" "modkey" "(set mod Mod4)"
        "+t" "open a terminal" ""
        "+w" "open Browser" ""
        "+n" "open Filebrowser" ""
        "+d" "app menu" "(rofi)"
        "+q" "close focused app" "(kill)"
        "Print-key" "screenshot" "(scrot)"
        "+Shift+BackSpace" "logout menu" "(rofi)"
        "+F1" "open keybinding helper" "full list"
    )

    "${command[@]}"
}

Main "$@"
