#!/bin/sh

PERCENTAGE="$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)"
CHARGING="$(pmset -g batt | grep 'AC Power')"

if [ "$PERCENTAGE" = "" ]; then
    exit 0
fi

# Battery
# 󰁹 100
# 󰂂 90
# 󰂁 80
# 󰂀 70
# 󰁿 60
# 󰁾 50
# 󰁽 40
# 󰁼 30
# 󰁻 20
# 󰁺 10
# 󰂎 0
# 󰂑 ?

# Charging
# 󰂅 100
# 󰂋 90
# 󰂊 80
# 󰂉 60
# 󰂈 40
# 󰂇 20
# 󰂆 10

case "${PERCENTAGE}" in
    100) ICON="󰁹" ;;
    9[0-9]) ICON="󰂂" ;;
    8[0-9]) ICON="󰂁" ;;
    7[0-9]) ICON="󰂀" ;;
    6[0-9]) ICON="󰁿" ;;
    5[0-9]) ICON="󰁾" ;;
    4[0-9]) ICON="󰁽" ;;
    3[0-9]) ICON="󰁼" ;;
    2[0-9]) ICON="󰁻" ;;
    1[0-9]) ICON="󰁻" ;;
    0[0-9]) ICON="󰂎" ;;
    *) ICON="󰂑"
esac

if [[ "$CHARGING" != "" ]]; then
    case "${PERCENTAGE}" in
        100) ICON="󰂅" ;;
        9[0-9]) ICON="󰂋" ;;
        8[0-9]) ICON="󰂊 " ;;
        [6-7][0-9]) ICON="󰂉" ;;
        [4-5][0-9]) ICON="󰂈" ;;
        [2-3][0-9]) ICON="󰂇" ;;
        [0-1][0-9]) ICON="󰂆" ;;
        *) ICON="󰂆"
    esac
fi

# The item invoking this script (name $NAME) will get its icon and label
# updated with the current battery status
sketchybar --set "$NAME" icon="$ICON" label="${PERCENTAGE}%"
