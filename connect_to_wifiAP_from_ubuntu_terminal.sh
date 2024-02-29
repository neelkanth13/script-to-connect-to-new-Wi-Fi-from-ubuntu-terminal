#!/bin/bash

# Check if the script is run with root (sudo) privileges
if [ "$(id -u)" -ne 0 ]; then
    echo "This script must be run as root (use sudo)." >&2
    exit 1
fi

# Check if the correct number of arguments (SSID and password) are provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <SSID> <password>" >&2
    echo "You need to provide the SSID and password as arguments." >&2
    exit 1
fi

SSID="$1"
PASSWORD="$2"

# Attempt to connect to the Wi-Fi network
nmcli device wifi connect "$SSID" password "$PASSWORD"

# Check the connection status
if [ $? -eq 0 ]; then
    echo "Successfully connected to $SSID."
else
    echo "Failed to connect to $SSID."
fi
