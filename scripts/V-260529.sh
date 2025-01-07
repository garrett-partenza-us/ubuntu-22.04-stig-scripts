#!/bin/bash

# Disable X11 forwarding
# Link: https://www.stigviewer.com/stig/canonical_ubuntu_22.04_lts/2024-03-21/finding/V-260529


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
