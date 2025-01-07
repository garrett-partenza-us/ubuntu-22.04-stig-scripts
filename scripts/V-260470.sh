#!/bin/bash

# Configure the grub superuser bootloader password with pdkdf2
# Link: https://www.stigviewer.com/stig/canonical_ubuntu_22.04_lts/2024-03-21/finding/V-260470


# Specify the root password here (plain text)
ROOT_PASSWORD="cBmUsMc2024!@#"

# Generate the PBKDF2 hash for the password
HASH=$(echo -n "$ROOT_PASSWORD" | grub-mkpasswd-pbkdf2 | grep -oP 'grub.pbkdf2.*')

# Add the superuser and password hash to the 40_custom file
echo -e "set superusers=\"root\"\npassword_pbkdf2 root $HASH" | sudo tee -a /etc/grub.d/40_custom > /dev/null

# Update GRUB to apply the changes
sudo update-grub

echo "GRUB superuser password has been set."
