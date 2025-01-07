#!/bin/bash

# Require 15 character minimum password length
# Link: https://www.stigviewer.com/stig/canonical_ubuntu_22.04_lts/2024-03-21/finding/V-260565


# Define the configuration file for pwquality
PWQUALITY_CONFIG="/etc/security/pwquality.conf"

# Delete any existing minlen setting using sed
sudo sed -i '/^minlen/d' $PWQUALITY_CONFIG

# Append the minlen setting with the desired value using tee
echo "minlen = 15" | sudo tee -a $PWQUALITY_CONFIG > /dev/null

echo "Password complexity enforced by requiring a minimum password length of 15 characters."

