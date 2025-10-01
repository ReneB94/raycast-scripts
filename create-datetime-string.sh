#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Create Datetime String
# @raycast.mode fullOutput
# @raycast.refreshTime 1m

# Optional parameters:
# @raycast.icon 🕰️
# @raycast.packageName Date & Time

# Documentation:
# @raycast.description Outputs the current time as an ISO date string

date -u +"%Y-%m-%dT%H:%M:%S.005Z"