#!/usr/local/bin/bash

#==== this script is from packrat @ https://github.com/PackRat-SC2018/desktop-01-configs he has some great stuff there.
# define layouts array

# mimic dwm style layout symbols
typeset -A layouts=(
  [tile]="[]="
  [rtile]="=[]"
  [mono]="[M]"
  [none]="><>"
  [float]="[F]"
  [grid]="[G]"
  [spiral]="[S]"
  [dwindle]="󰕴"
  [tstack]="[TT]"
  [astack]="[AT]"
)

# Fetch the status and sanitize the JSON output using tr
raw_output=$(dkcmd status num=1 | tr -d '\000-\037')

# Check if raw_output is not empty
if [ -z "$raw_output" ]; then
  echo "Error: Failed to get output from dkcmd"
  exit 1
fi

# Fetch the layout of the focused workspace using jq to parse the JSON
layout=$(echo "$raw_output" | jq -r '.workspaces[] | select(.focused == true) | .layout')

# Check if layout is empty or not in the array
if [ -z "$layout" ]; then
  echo "Error: layout is empty or not found"
  layout="unknown"
fi

# Map the layout to its corresponding symbol
layout="${layouts[$layout]}"

# Provide a default display if layout is unknown
echo "${layout:-???}"

exit 0
