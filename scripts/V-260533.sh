#!/bin/bash

# Change the SSH configuration to only accept FIPS-validated key exchanges
# Link: https://www.stigviewer.com/stig/canonical_ubuntu_22.04_lts/2024-03-21/finding/V-260533


# Define the SSH config file
SSHD_CONFIG="/etc/ssh/sshd_config"

# Ensure the KexAlgorithms setting is correctly configured
sudo sed -i '/^KexAlgorithms/ d' "$SSHD_CONFIG"  # Remove any existing KexAlgorithms line

# Add the required key exchange algorithms (FIPS-validated)
echo "KexAlgorithms ecdh-sha2-nistp256,ecdh-sha2-nistp384,ecdh-sha2-nistp521,diffie-hellman-group-exchange-sha256" | sudo tee -a "$SSHD_CONFIG" > /dev/null

# Restart the SSH service to apply the changes
sudo systemctl restart sshd.service

# Output confirmation
echo "SSH server configured to use only FIPS-validated key exchange algorithms. Changes applied successfully."
