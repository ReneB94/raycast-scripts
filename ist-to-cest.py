#!/usr/bin/env python3

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title IST to Berlin Time
# @raycast.mode compact

# Optional parameters:
# @raycast.icon 🕐
# @raycast.argument1 { "type": "text", "placeholder": "HH:MM (IST)" }

import sys
from datetime import datetime, date
from zoneinfo import ZoneInfo

time_str = sys.argv[1].strip()

try:
    t = datetime.strptime(time_str, "%H:%M")
    today = date.today()
    ist_dt = datetime(today.year, today.month, today.day, t.hour, t.minute,
                      tzinfo=ZoneInfo("Asia/Kolkata"))
    berlin_dt = ist_dt.astimezone(ZoneInfo("Europe/Berlin"))
    diff = (berlin_dt.utcoffset().total_seconds() - ist_dt.utcoffset().total_seconds()) / 3600
    diff_str = f"{int(diff):+.0f}h" if diff == int(diff) else f"{diff:+.1f}h"
    print(f"{berlin_dt.strftime('%H:%M')} Berlin ({berlin_dt.strftime('%Z')}, IST{diff_str})")
except ValueError:
    print("Invalid format — use HH:MM")
    sys.exit(1)