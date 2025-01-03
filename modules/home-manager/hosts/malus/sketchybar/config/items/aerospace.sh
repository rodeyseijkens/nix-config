sketchybar --add event aerospace_workspace_change

for sid in $(aerospace list-workspaces --all); do
    sketchybar --add item space.$sid left \
        --subscribe space.$sid aerospace_workspace_change \
        --set space.$sid \
        background.color=0x44ffffff \
        background.corner_radius=4 \
        background.height=30 \
        background.drawing=off \
        label="$sid" \
        label.padding_right=10 \
        label.padding_left=10 \
        icon.padding_right=0 \
        icon.padding_left=0 \
        click_script="aerospace workspace $sid" \
        script="$CONFIG_DIR/plugins/aerospace.sh $sid"
done
