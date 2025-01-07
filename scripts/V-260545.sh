#!/bin/bash

# Enforce a one day minimum password lifetime for new accounts
# Link: https://www.stigviewer.com/stig/canonical_ubuntu_22.04_lts/2024-05-30/finding/V-260545


# Define the configuration file
CONFIG_FILE="/etc/login.defs"

# Delete any existing PASS_MIN_DAYS lines using sed
sudo sed -i '/^PASS_MIN_DAYS/d' $CONFIG_FILE

# Append the desired PASS_MIN_DAYS setting using tee
echo "PASS_MIN_DAYS 1" | sudo tee -a $CONFIG_FILE > /dev/null

echo "Password minimum lifetime set to 1 day."
