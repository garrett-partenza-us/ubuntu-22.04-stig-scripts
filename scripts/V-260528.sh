#!/bin/bash

# This script configures the SSH server to automatically terminate a session 
# after 10 minutes of inactivity by setting 'ClientAliveInterval' to 600 in '/etc/ssh/sshd_config'.

# Define the SSH config file
SSHD_CONFIG="/etc/ssh/sshd_config"

# Ensure the ClientAliveInterval is set to 600 or less
sudo sed -i '/^ClientAliveInterval/ d' "$SSHD_CONFIG"  # Remove any existing ClientAliveInterval line

# Add the required setting
echo "ClientAliveInterval 600" | sudo tee -a "$SSHD_CONFIG" > /dev/null

# Restart the SSH service to apply the changes
sudo systemctl restart sshd.service

# Output confirmation
echo "SSH server configured to terminate idle sessions after 10 minutes. Changes applied successfully."
