#!/bin/bash

# Disable account identifiers after 25 days of inactivity
# Link: https://www.stigviewer.com/stig/canonical_ubuntu_22.04_lts/2024-05-30/finding/V-260547


# Apply the inactivity timeout using useradd command
sudo useradd -D -f 35

echo "Account inactivity is set to 35 days. Accounts will be disabled after 35 days of inactivity."

