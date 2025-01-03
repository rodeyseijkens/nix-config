#!/bin/bash

front_app=(
    display=active
    icon=󰁕
    icon.font="$FONT:Bold:16.0"
    label.font="$FONT:Bold:16.0"
    icon.padding_left=10
    icon.padding_right=5
    label.padding_left=5
    label.padding_right=10
    script="$PLUGIN_DIR/front_app.sh"
)

sketchybar --add item front_app left \
    --set front_app "${front_app[@]}" \
    --subscribe front_app front_app_switched
