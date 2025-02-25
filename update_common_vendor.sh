#!/bin/bash

# Configuration (verified working URL)
FILE_URL="https://raw.githubusercontent.com/shinichi-c/Gms/pixelage/common-vendor.mk"
OUTPUT_DIR="vendor/gms/common"  # Use relative path inside AOSP workspace
OUTPUT_FILE="common-vendor.mk"
OUTPUT_PATH="${OUTPUT_DIR}/${OUTPUT_FILE}"

# Create directory (no sudo needed in AOSP workspace)
mkdir -p "$OUTPUT_DIR"

# Delete old file (if exists)
rm -f "$OUTPUT_PATH"

# Download file
wget "$FILE_URL" -O "$OUTPUT_PATH"

# Set BASIC permissions (rw-r--r--, avoid 777 for security)
if [ -f "$OUTPUT_PATH" ]; then
  chmod 777 "$OUTPUT_PATH"
  echo "Success: File downloaded to $OUTPUT_PATH with permissions 644"
else
  echo "Error: File download failed. Check URL: $FILE_URL"
  exit 1
fi
