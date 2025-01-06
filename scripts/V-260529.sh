#!/bin/bash

# This script configures the SSH server to disable X11 forwarding by setting 
# 'X11Forwarding no' in the '/etc/ssh/sshd_config' file to enhance security.

# Define the SSH config file
SSHD_CONFIG="/etc/ssh/sshd_config"

# Ensure the X11Forwarding setting is 'no'
sudo sed -i '/^X11Forwarding/ d' "$SSHD_CONFIG"  # Remove any existing X11Forwarding line

# Add the required setting to disable X11 forwarding
echo "X11Forwarding no" | sudo tee -a "$SSHD_CONFIG" > /dev/null

# Restart the SSH service to apply the changes
sudo systemctl restart sshd.service

# Output confirmation
echo "SSH server configured to disable X11 forwarding. Changes applied successfully."
