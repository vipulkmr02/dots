#!/usr/bin/env bash

# TMUX widgets.sh file

# This script takes a bunch of widgets as command line
# arguments and outputs them as a formatted string.


# Widgets
battery() {
    output=""
    if [[ $(acpi -b | awk 'NR==1{print $3}') = 'Charging,' ]]; then
        output+="󰂄 "
    else
        output+="󰁹 "
    fi
    batteryCapacity=$(acpi -b | awk 'NR==1{print $4}')
    output+=$(printf "%02d" "$batteryCapacity")
    echo "$output%"
}

mem() {
    icon=" "
    output=$(free | grep 'Mem:' | awk '{print ($3 / $2) * 100}')
    echo "$icon$(printf "%02.0f" "$output")"
}

cpu() {
    icon=" "
    output=$(top -bn1 | grep 'Cpu(s)' | awk '{print $2 + $4 + $6 + $10 + $12 + $14 + $16 }')
    echo "$icon$(printf "%02.0f" "$output")"
}

random_emoji() {
    emojis=(
        "❤️" "😃" "💊" "🖕" "🦕" "🦖" "🖤" "😇" "🐯"
        "🙃" "🐶" "😌" "🐵" "😍" "😗" "🐼" "🐮" "💾"
        "🎤" "🎸" "🎻" "🎺" "🥪" "🍔" "🍕" "🎧" "😺"
    )

    # making sure that last emoji is not repeated
    # by using RANDOM
    last_emoji="${tmux_pane_last_emoji:-}"

    while $last_emoji -eq "${emojis[random_index]}"; do
        random_index=$((RANDOM % ${#emojis[@]}))
    done
    random_index=$((RANDOM % ${#emojis[@]}))

    export tmux_pane_last_emoji="${emojis[random_index]}"
    echo "${emojis[$random_index]}"
}

caps_lock() {
    if xset q | grep "Caps Lock: *on" > /dev/null; then
        echo "󰘲 "
    fi
}

# Driver Code

if [[ $# -eq 0 ]]; then
    echo "Usage: $0 <widget1> <widget2>... <widgetN>"
    exit 1
fi

$1
