#!/bin/bash

metadata=$(playerctl -a metadata --format '{{playerName}}::{{artist}}::{{title}}' 2>/dev/null)
# Check if playerctl returned metadata
if [ -z "$metadata" ]; then
    echo "󰇘"
    exit 1
fi
# Parse the metadata using '::' as a delimiter
IFS='::' read -r playerName artist title <<< "$metadata"
case "$playerName" in
    spotify)
        icon=""
        output="${icon} ${title}" # For Spotify, show both artist and title
        ;;
    firefox)
        icon=""
        output="${icon} ${title}" # For Spotify, show both artist and title
        ;;
    mpv)
        icon=""
        output="${icon} ${title}" # For Spotify, show both artist and title
        ;;
    *)
        icon="" # Default music icon for other players
        output="${icon} ${title}" # For others, show only the title
        ;;
esac
output=$(echo $output | sed 's/::/ - /g') # Replaces any "::" with " - "
echo "$output"

