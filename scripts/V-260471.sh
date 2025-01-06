#!/bin/bash

# By adding audit=1 to the GRUB configuration, this change enables the
# Linux audit subsystem to log security-relevant events from the moment 
# the system starts. This enhances system security by ensuring that all 
# critical actions, such as login attempts and system changes, are recorded
# for later analysis and potential incident response.

# Define the grub configuration file path
GRUB_FILE="/etc/default/grub"

# Add 'audit=1' to the GRUB_CMDLINE_LINUX option if not already present
if ! grep -q "audit=1" "$GRUB_FILE"; then
  sudo sed -i 's/^GRUB_CMDLINE_LINUX="\(.*\)"/GRUB_CMDLINE_LINUX="\1 audit=1"/' "$GRUB_FILE"
fi

# Update GRUB configuration
sudo update-grub

# Output the result
echo "Audit records will be produced at system startup. GRUB updated successfully."
