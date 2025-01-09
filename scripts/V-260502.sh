#!/bin/bash

# This script modifies the /usr/lib/tmpfiles.d/systemd.conf to set the appropriate group ownership for /run/log/journal and /var/log/journal directories.

sudo sed -i '/\/run\/log\/journal/d' /usr/lib/tmpfiles.d/systemd.conf
echo "z /run/log/journal 2640 root systemd-journal - -" | sudo tee -a /usr/lib/tmpfiles.d/systemd.conf

sudo sed -i '/\/var\/log\/journal/d' /usr/lib/tmpfiles.d/systemd.conf
echo "z /var/log/journal 2640 root systemd-journal - -" | sudo tee -a /usr/lib/tmpfiles.d/systemd.conf
