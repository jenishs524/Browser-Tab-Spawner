#!/bin/bash
# ================================================================
# WARNING: This script opens many browser tabs and can slow down
# or crash your system. Use only on machines you own or have
# explicit permission to test. Do not use maliciously.
# ================================================================

# -------- CONFIGURATION --------
TABS=100                    # Number of tabs to open
URL="https://example.com"   # URL to load in each tab
DELAY=0.1                   # Seconds between each tab (adjust if needed)
# ------------------------------

# Try to detect a supported browser
BROWSER=""
if command -v firefox &>/dev/null; then
    BROWSER="firefox"
elif command -v google-chrome &>/dev/null; then
    BROWSER="google-chrome"
elif command -v chromium-browser &>/dev/null; then
    BROWSER="chromium-browser"
else
    echo "ERROR: No supported browser found. Install Firefox, Chrome, or Chromium."
    exit 1
fi

echo "Opening $TABS tabs in $BROWSER with URL: $URL"
echo "Press Ctrl+C to stop (if the loop is still running)."

# Open tabs in a loop
for ((i=1; i<=TABS; i++)); do
    case "$BROWSER" in
        firefox)
            "$BROWSER" --new-tab "$URL" &
            ;;
        google-chrome|chromium-browser)
            "$BROWSER" --new-tab "$URL" &
            ;;
        *)
            # Fallback to xdg-open (may open new windows instead of tabs)
            xdg-open "$URL" &
            ;;
    esac
    sleep "$DELAY"
done

echo "All $TABS tabs have been launched."