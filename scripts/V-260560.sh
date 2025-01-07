#!/bin/bash

# Require one uppercase letter in passwords
# Link: https://www.stigviewer.com/stig/canonical_ubuntu_22.04_lts/2024-03-21/finding/V-260560


# Define the configuration file for pwquality
PWQUALITY_CONFIG="/etc/security/pwquality.conf"

# Delete any existing ucredit setting using sed
sudo sed -i '/^ucredit/d' $PWQUALITY_CONFIG

# Append the ucredit setting with the desired value using tee
echo "ucredit = -1" | sudo tee -a $PWQUALITY_CONFIG > /dev/null

echo "Password complexity enforced by requiring at least one uppercase character."
