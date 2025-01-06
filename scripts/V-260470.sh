#!/bin/bash

# This script generates a hashed password for GRUB and configures the root user 
# with it, securing the bootloader. It prevents unauthorized access to the GRUB
# menu and boot-time modifications by requiring a password for root access.

# Specify the root password here (plain text)
ROOT_PASSWORD="cBmUsMc2024!@#"

# Generate the PBKDF2 hash for the password
HASH=$(echo -n "$ROOT_PASSWORD" | grub-mkpasswd-pbkdf2 | grep -oP 'grub.pbkdf2.*')

# Add the superuser and password hash to the 40_custom file
echo -e "set superusers=\"root\"\npassword_pbkdf2 root $HASH" | sudo tee -a /etc/grub.d/40_custom > /dev/null

# Update GRUB to apply the changes
sudo update-grub

echo "GRUB superuser password has been set."
