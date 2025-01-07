#!/bin/bash

# Configure the SSH server to prevent remote hosts from connecting
# to the proxy display
# https://www.stigviewer.com/stig/canonical_ubuntu_18.04_lts/2021-11-29/finding/V-233780


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
