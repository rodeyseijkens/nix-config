#!/bin/bash

sketchybar  --add item battery right \
    --set battery \
    update_freq=120 \
    icon.padding_left=10 \
    icon.padding_right=5 \
    label.padding_left=5 \
    label.padding_right=10 \
    script="$PLUGIN_DIR/battery.sh" \
    --subscribe battery system_woke power_source_change
