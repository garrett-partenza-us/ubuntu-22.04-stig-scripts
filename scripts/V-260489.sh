#!/bin/bash

# Change the system log files to be 640 mode or less permissive

# Change the mode
sudo find /var/log -perm /137 ! -name '*[bw]tmp' ! -name '*lastlog' -type f -exec chmod 640 '{}' \;
