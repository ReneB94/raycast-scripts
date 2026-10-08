#!/usr/bin/env node

// Required parameters:
// @raycast.schemaVersion 1
// @raycast.title Stringify JSON
// @raycast.mode fullOutput

// Optional parameters:
// @raycast.icon 🔧
// @raycast.argument1 { "type": "text", "placeholder": "Enter JSON" }

// Documentation:
// @raycast.description Stringifies a JSON


const input = process.argv.slice(2)[0];

try {
  const parsed = JSON.parse(input);
  console.log(JSON.stringify(JSON.stringify(parsed)));
} catch (error) {
  console.error("❌ Invalid JSON");
  process.exit(1);
}
