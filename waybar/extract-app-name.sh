#!/bin/bash
window_title=$(xdotool getactivewindow getwindowname)
app_name=$(echo "$window_title" | awk -F ' - ' '{print $NF}')
echo "$app_name"
