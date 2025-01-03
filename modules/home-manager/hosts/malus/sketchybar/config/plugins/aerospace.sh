#!/usr/bin/env bash

for m in $(aerospace list-monitors); do

    # Show non-empty workspaces
    for sid in $(aerospace list-workspaces --monitor $m --empty no); do
        if [ "$1" = $sid ]; then
            sketchybar --set space.$sid display=1
        fi
    done

    # Hide empty workspaces
    for sid in $(aerospace list-workspaces --monitor $m --empty); do
        if [ "$1" = $sid ]; then
            sketchybar --set space.$sid display=0
        fi
    done

done


if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
    sketchybar --set $NAME display=active background.drawing=on
else
    sketchybar --set $NAME background.drawing=off
fi
