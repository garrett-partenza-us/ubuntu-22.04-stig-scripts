#!/bin/bash

# This script checks the group ownership of system library files in /lib,
# /lib64, and /usr/lib, and ensures that any files not group-owned by 'root'
# are corrected.

# Define the directories to check
DIRECTORIES=("/lib" "/lib64" "/usr/lib")

# Find files not group-owned by 'root' and change their group to 'root'
for DIR in "${DIRECTORIES[@]}"; do
    # Find files not group-owned by 'root' and change their group ownership to 'root'
    sudo find "$DIR" ! -group root -type f -exec sudo chgrp root {} \;
done

# Confirm the change
echo "Group ownership of system libraries in $DIRECTORIES has been fixed to 'root'."

