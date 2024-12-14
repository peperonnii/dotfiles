#!/bin/bash

# Bluetooth device MAC address (replace with your device's address)
DEVICE_MAC="54:AE:06:3C:50:B9"

# Ensure Bluetooth is powered on
bluetoothctl power on

# Make the Bluetooth agent default to handle pairing automatically
bluetoothctl agent on
bluetoothctl default-agent

# Trust the device (optional, but helps for automatic connections in the future)
bluetoothctl trust $DEVICE_MAC

# Loop until the device is successfully connected
while true; do
    # Attempt to connect to the device
    bluetoothctl connect $DEVICE_MAC

    # Check if connection was successful
    if bluetoothctl info $DEVICE_MAC | grep -q "Connected: yes"; then
        # Send a notification if the device is connected
        notify-send "Bluetooth Device" "Device $DEVICE_MAC connected successfully!"
        echo "Device $DEVICE_MAC connected successfully!"
        break
    else
        sleep 5
    fi
done
