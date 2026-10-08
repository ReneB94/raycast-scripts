#!/usr/bin/env python3

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Berlin to IST
# @raycast.mode compact

# Optional parameters:
# @raycast.icon 🕐
# @raycast.argument1 { "type": "text", "placeholder": "HH:MM (Berlin)" }

import sys
from datetime import datetime, date
from zoneinfo import ZoneInfo

time_str = sys.argv[1].strip()

try:
    t = datetime.strptime(time_str, "%H:%M")
    today = date.today()
    berlin_dt = datetime(today.year, today.month, today.day, t.hour, t.minute,
                         tzinfo=ZoneInfo("Europe/Berlin"))
    ist_dt = berlin_dt.astimezone(ZoneInfo("Asia/Kolkata"))
    diff = (ist_dt.utcoffset().total_seconds() - berlin_dt.utcoffset().total_seconds()) / 3600
    diff_str = f"{int(diff):+.0f}h" if diff == int(diff) else f"{diff:+.1f}h"
    print(f"{ist_dt.strftime('%H:%M')} IST ({berlin_dt.strftime('%Z')}{diff_str})")
except ValueError:
    print("Invalid format — use HH:MM")
    sys.exit(1)
