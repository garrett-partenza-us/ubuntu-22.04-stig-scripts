#!/bin/bash

# Set root as ownder of audit files for user and group
# Link: https://www.tenable.com/audits/items/DISA_STIG_Canonical_Ubuntu_22.04_LTS_v2r2.audit:ea6284bee6d63724ba5125e4c7a7fd3f


# Define the files and directories to be checked
AUDIT_FILES="/etc/audit/audit.rules /etc/audit/auditd.conf /etc/audit/rules.d/*"

# Change ownership of the audit files and directories to root
sudo chown -R root:root $AUDIT_FILES

# Output completion message
echo "Ownership of audit files and directories updated to 'root'."
