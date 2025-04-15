#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Encode Base64
# @raycast.mode fullOutput

# Optional parameters:
# @raycast.icon 🔧
# @raycast.argument1 { "type": "text", "placeholder": "Enter String" }

input="$1"

encoded=$(echo "$input" | base64)

echo "$encoded"
