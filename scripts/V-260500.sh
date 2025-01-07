#!/bin/bash

# Change library files group ownership to root
# Link: https://www.stigviewer.com/stig/canonical_ubuntu_22.04_lts/2024-05-30/finding/V-260500


# Define the directories to check
DIRECTORIES=("/lib" "/lib64" "/usr/lib")

# Find files not group-owned by 'root' and change their group to 'root'
for DIR in "${DIRECTORIES[@]}"; do
    # Find files not group-owned by 'root' and change their group ownership to 'root'
    sudo find "$DIR" ! -group root -type f -exec sudo chgrp root {} \;
done

# Confirm the change
echo "Group ownership of system libraries in $DIRECTORIES has been fixed to 'root'."

