#!/bin/bash

# Configure APT to remove unused kernel packages and dependencies after updates.
# Link: https://www.stigviewer.com/stig/canonical_ubuntu_18.04_lts/2021-11-29/finding/V-233780

# Define the APT configuration file path
APT_CONF_FILE="/etc/apt/apt.conf.d/50unattended-upgrades"

# Add or modify the required lines in the configuration file
sudo sed -i '/Unattended-Upgrade::Remove-Unused-Kernel-Packages/ d' "$APT_CONF_FILE"
sudo sed -i '/Unattended-Upgrade::Remove-Unused-Dependencies/ d' "$APT_CONF_FILE"
echo 'Unattended-Upgrade::Remove-Unused-Kernel-Packages "true";' | sudo tee -a "$APT_CONF_FILE" > /dev/null
echo 'Unattended-Upgrade::Remove-Unused-Dependencies "true";' | sudo tee -a "$APT_CONF_FILE" > /dev/null

# Output the result
echo "APT configured to remove unused kernel packages and dependencies after updates."
