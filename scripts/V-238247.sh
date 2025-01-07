#!/bin/bash

# Define the config file
AUDIT_CONF="/etc/audit/auditd.conf"

# Remove any existing log_group entry
sudo sed -i '/^log_group/D' "$AUDIT_CONF"
# Add the correct log_group value after the log_file line
sudo sed -i '/^log_file/a log_group = root' "$AUDIT_CONF"

sudo systemctl kill auditd -s SIGHUP

echo "Audit configuration updated. Log group is now set to 'root'."
