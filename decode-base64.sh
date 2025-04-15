#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Decode Base64
# @raycast.mode fullOutput

# Optional parameters:
# @raycast.icon 🔧
# @raycast.argument1 { "type": "text", "placeholder": "Enter Base64 String" }

input="$1"

decoded=$(echo "$input" | base64 --decode)

echo "$decoded"
