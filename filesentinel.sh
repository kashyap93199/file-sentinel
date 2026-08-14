#!/bin/bash

clear

echo "=========================================="
echo "        FILE SENTINEL v2.0"
echo "=========================================="
echo

if [ -z "$1" ]; then
    echo "Error: No file path provided."
    echo
    echo "Usage:"
    echo "  ./filesentinel.sh <file-path>"
    echo
    echo "Example:"
    echo "  ./filesentinel.sh test.txt"
    exit 1
fi

FILE="$1"
BASELINE="${FILE}.sha256"

if [ ! -f "$FILE" ]; then
    echo "File not found: $FILE"
    exit 1
fi

echo "File: $FILE"
echo

if [ ! -f "$BASELINE" ]; then

    sha256sum "$FILE" > "$BASELINE"

    echo "No baseline found."
    echo "Baseline created!"
    echo "SHA-256 hash saved."
    echo
    echo "Run the script again to check the file."

    exit 0
fi

CURRENT_HASH=$(sha256sum "$FILE" | awk '{print $1}')
OLD_HASH=$(awk '{print $1}' "$BASELINE")

echo "Checking file integrity..."
echo

if [ "$CURRENT_HASH" = "$OLD_HASH" ]; then

    echo "STATUS: File is unchanged."
    echo "Integrity: OK"

else

    echo "WARNING: File has been changed!"
    echo
    echo "Old SHA-256:"
    echo "$OLD_HASH"
    echo
    echo "New SHA-256:"
    echo "$CURRENT_HASH"
    echo
    echo "Integrity check FAILED."

fi

echo
echo "=========================================="
echo "             CHECK COMPLETE"
echo "=========================================="
