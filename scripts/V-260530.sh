#!/bin/bash

# This script configures the SSH server to prevent remote hosts from connecting
# to the proxy display by setting 'X11UseLocalhost yes' in the '/etc/ssh/sshd_config' file.

# Define the SSH config file
SSHD_CONFIG="/etc/ssh/sshd_config"

# Ensure the X11UseLocalhost setting is 'yes'
sudo sed -i '/^X11UseLocalhost/ d' "$SSHD_CONFIG"  # Remove any existing X11UseLocalhost line

# Add the required setting to restrict remote hosts from connecting
echo "X11UseLocalhost yes" | sudo tee -a "$SSHD_CONFIG" > /dev/null

# Restart the SSH service to apply the changes
sudo systemctl restart sshd.service

# Output confirmation
echo "SSH server configured to prevent remote hosts from connecting to the proxy display. Changes applied successfully."
