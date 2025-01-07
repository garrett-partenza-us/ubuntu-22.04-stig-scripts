#!/bin/bash

# Enforce complex password construction and configuration by
# installing the pwquality package
# Link: https://www.stigviewer.com/stig/canonical_ubuntu_22.04_lts/2024-05-30/finding/V-260478A


# Install pwquality package
sudo apt-get install -y libpam-pwquality 
