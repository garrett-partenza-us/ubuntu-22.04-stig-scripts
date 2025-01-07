#!/bin/bash

# Enable audit logging
# Link: https://www.stigviewer.com/stig/canonical_ubuntu_22.04_lts/2024-05-30/finding/V-260591

sudo systemctl enable auditd.service --now
echo "Audit logging enabled."
