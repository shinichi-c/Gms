#!/bin/bash

# Configuration
FILE_URL="https://raw.githubusercontent.com/shinichi-c/Gms/pixelage/common-vendor.mk"
OUTPUT_DIR="vendor/gms/common"  # Target directory
OUTPUT_FILE="common-vendor.mk"   # Filename
OUTPUT_PATH="${OUTPUT_DIR}/${OUTPUT_FILE}"  # Full path

# Create directory (if it doesn't exist)
sudo mkdir -p "$OUTPUT_DIR"

# Delete old file (if exists)
sudo rm -f "$OUTPUT_PATH"

# Download the new file to the target directory
sudo wget "$FILE_URL" -O "$OUTPUT_PATH"

# Check if download succeeded
if [ $? -eq 0 ]; then
  echo "Success: File saved to $OUTPUT_PATH"
else
  echo "Error: Failed to download. Check permissions, URL, or network."
  exit 1
fi