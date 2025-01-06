#!/bin/bash

# This script configures APT to remove unused kernel packages and dependencies 
# after updates by modifying the "/etc/apt/apt.conf.d/50-unattended-upgrades" file.

# Define the APT configuration file path
APT_CONF_FILE="/etc/apt/apt.conf.d/50unattended-upgrades"

# Add or modify the required lines in the configuration file
sudo sed -i '/Unattended-Upgrade::Remove-Unused-Kernel-Packages/ d' "$APT_CONF_FILE"
sudo sed -i '/Unattended-Upgrade::Remove-Unused-Dependencies/ d' "$APT_CONF_FILE"
echo 'Unattended-Upgrade::Remove-Unused-Kernel-Packages "true";' | sudo tee -a "$APT_CONF_FILE" > /dev/null
echo 'Unattended-Upgrade::Remove-Unused-Dependencies "true";' | sudo tee -a "$APT_CONF_FILE" > /dev/null

# Output the result
echo "APT configured to remove unused kernel packages and dependencies after updates."
