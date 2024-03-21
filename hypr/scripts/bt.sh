#!/bin/bash

# MAC address of the Bluetooth device you want to connect to
DEVICE_MAC="54:AE:06:3C:50:B9"

while true; do
    # Check if the device is already connected
    if bluetoothctl info "$DEVICE_MAC" | grep -q "Connected: yes"; then
        echo "Device $DEVICE_MAC is already connected."
        # Device is connected, sleep for 30 seconds
        sleep 15
    else
        echo "Device $DEVICE_MAC is not connected. Attempting to connect..."
        bluetoothctl connect "$DEVICE_MAC"
        # Attempted to connect, sleep for 3 seconds before checking again
        sleep 3
    fi
done

