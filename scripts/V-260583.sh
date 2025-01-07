#!/bin/bash

# Install the advanced intrusion detector package and initalize
# with monitoring the default configured file paths.
# Link: https://www.stigviewer.com/stig/canonical_ubuntu_22.04_lts/2024-05-30/finding/V-260583

sudo apt-get install -y aide
sudo aideinit

echo "AIDE installation and initialization complete."

