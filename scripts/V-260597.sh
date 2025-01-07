#!/bin/bash

# Change permissions on audit logs to prevent unauthorized disclosure
# Link: https://www.stigviewer.com/stig/canonical_ubuntu_22.04_lts/2024-03-21/finding/V-260597

sudo chmod 600 /var/log/audit/*
echo "Audit log permissions hardened."
