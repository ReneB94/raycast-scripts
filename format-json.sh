#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Format JSON
# @raycast.mode fullOutput

# Optional parameters:
# @raycast.icon 🔧
# @raycast.argument1 { "type": "text", "placeholder": "Enter JSON" }

# Documentation:
# @raycast.description Format JSON using jq. You can also use this to unescape JSON strings.

if ! command -v jq &> /dev/null; then
    echo "Error: jq is not installed. Please install it first."
    exit 1
fi

json_input="$1"

if [[ "$json_input" =~ ^\".*\"$ ]]; then
    json_input=$(echo "$json_input" | sed 's/^"//' | sed 's/"$//')
fi

# Check if the input is an escaped JSON string (starts with "{\)
if [[ "$json_input" =~ ^\{\\.* ]]; then
    # Remove surrounding quotes and replace \" with "
    json_input=$(echo "$json_input" | sed 's/\\"/"/g')
fi

formatted_json=$(echo "$json_input" | jq '.')

if [ $? -eq 0 ]; then
    echo "$formatted_json"
else
    echo "Error: Invalid JSON input"
fi
