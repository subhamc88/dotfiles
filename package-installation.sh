#!/bin/bash

# Specify the file containing the package list
PACKAGE_LIST_FILE="package.txt"

# Check if the package list file exists
if [[ ! -f "$PACKAGE_LIST_FILE" ]]; then
    echo "Package list file not found: $PACKAGE_LIST_FILE"
    exit 1
fi

# Update the package database
sudo paru -Sy --noconfirm

# Read the package list from the file and install each package
while IFS= read -r PACKAGE; do
    # Skip empty lines and comments
    [[ -z "$PACKAGE" || "$PACKAGE" =~ ^# ]] && continue
    echo "Installing $PACKAGE..."
    paru -S --noconfirm "$PACKAGE"
done < "$PACKAGE_LIST_FILE"

echo "All packages have been installed."
