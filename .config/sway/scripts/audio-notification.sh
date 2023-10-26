#!/usr/local/bin/bash

# Script to create pop-up notification and play a sound when volume changes.

# Create a delay so the change in volume can be registered:
sleep 0.05

# Get the volume and check if muted or not (STATE):
VOLUME=$(pamixer --get-volume)
IS_MUTE=$(pamixer --get-mute)

# Get the sound file path. Adjust this path to point to your desired sound file.
SOUND_FILE="/home/ron/.config/sway/sounds/audio-volume-change.oga"

# Play the sound using paplay
paplay "$SOUND_FILE" &

# Initialize notification message
NOTIFICATION_MESSAGE=""

# Set the message based on the mute status
if [[ $IS_MUTE == 'true' ]]; then
    NOTIFICATION_MESSAGE="Muted"
else
    NOTIFICATION_MESSAGE="Volume: $VOLUME%"
fi

# Set the icon based on the volume level
if [ "${VOLUME}" == "0" ]; then
    ICON=~/.config/sway/icons/vol-mute.png
elif [ "${VOLUME}" -lt "33" ] && [ $VOLUME -gt "0" ]; then
    ICON=~/.config/sway/icons/vol-low.png
elif [ "${VOLUME}" -lt "90" ] && [ $VOLUME -ge "33" ]; then
    ICON=~/.config/sway/icons/vol-med.png
else
    ICON=~/.config/sway/icons/vol-high.png
fi

~/.config/sway/notify-send.sh/notify-send.sh "$NOTIFICATION_MESSAGE" \
    --replace-file=/tmp/audio-notification \
    -t 2000 \
    -i ${ICON} \
    -h int:value:${VOLUME} \
    -h string:synchronous:volume-change
