#!/bin/bash

# Require one numeric character in passwords
# Link: https://www.stigviewer.com/stig/canonical_ubuntu_22.04_lts/2024-03-21/finding/V-260562


# Define the configuration file for pwquality
PWQUALITY_CONFIG="/etc/security/pwquality.conf"

# Delete any existing dcredit setting using sed
sudo sed -i '/^dcredit/d' $PWQUALITY_CONFIG

# Append the dcredit setting with the desired value using tee
echo "dcredit = -1" | sudo tee -a $PWQUALITY_CONFIG > /dev/null

echo "Password complexity enforced by requiring at least one numeric character."
