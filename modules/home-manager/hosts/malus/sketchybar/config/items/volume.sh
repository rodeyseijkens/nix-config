#!/bin/bash

# Some items refresh on a fixed cycle, e.g. the clock runs its script once
# every 10s. Other items respond to events they subscribe to, e.g. the
# volume.sh script is only executed once an actual change in system audio
# volume is registered. More info about the event system can be found here:
# https://felixkratz.github.io/SketchyBar/config/events

sketchybar --add item volume right \
    --set volume \
    icon.padding_left=10 \
    icon.padding_right=5 \
    label.padding_left=5 \
    label.padding_right=10 \
    script="$PLUGIN_DIR/volume.sh" \
    --subscribe volume volume_change
