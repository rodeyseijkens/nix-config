#!/bin/bash

sketchybar --add item clock right \
    --set clock \
    update_freq=10 \
    icon=󰥔 \
    icon.padding_left=10 \
    icon.padding_right=5 \
    label.padding_left=5 \
    label.padding_right=10 \
    script="$PLUGIN_DIR/clock.sh"
