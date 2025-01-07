#!/bin/bash

# Do not allow users to login with empty passwords or send environment variables
# durring login.
# Link: https://www.stigviewer.com/stig/canonical_ubuntu_18.04_lts/2023-09-08/finding/V-219314


# Define the SSH config file
SSHD_CONFIG="/etc/ssh/sshd_config"

# Ensure the correct settings are present in the SSH config file
sudo sed -i '/^PermitEmptyPasswords/ d' "$SSHD_CONFIG" # Remove any existing line
sudo sed -i '/^PermitUserEnvironment/ d' "$SSHD_CONFIG" # Remove any existing line

# Add the required settings
echo "PermitEmptyPasswords no" | sudo tee -a "$SSHD_CONFIG" > /dev/null
echo "PermitUserEnvironment no" | sudo tee -a "$SSHD_CONFIG" > /dev/null

# Restart the SSH service to apply the changes
sudo systemctl restart sshd.service

# Output confirmation
echo "SSH daemon configured to prevent unattended login. Changes applied successfully."
