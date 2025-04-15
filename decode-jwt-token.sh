#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Decode JWT Token
# @raycast.mode fullOutput

# Optional parameters:
# @raycast.icon 🔧
# @raycast.argument1 { "type": "text", "placeholder": "Enter String" }

# Check if a token is provided
if [ -z "$1" ]; then
    echo "Please provide a JWT token as an argument"
    echo "Usage: ./decode-jwt-token.sh <token>"
    exit 1
fi

# Get the token from command line argument
token=$1

echo "Header: $(jq -R 'split(".") | .[0] | @base64d | fromjson' <<< "$token")"
echo "Payload: $(jq -R 'split(".") | .[1] | @base64d | fromjson' <<< "$token")"
