#!/bin/bash
# This script modifies the /usr/lib/tmpfiles.d/systemd.conf to set the appropriate group ownership for the systemd journal files.

sudo sed -i '/\/run\/log\/journal\/%m/d' /usr/lib/tmpfiles.d/systemd.conf
echo "Z /run/log/journal/%m ~2640 root systemd-journal - -" | sudo tee -a /usr/lib/tmpfiles.d/systemd.conf

sudo sed -i '/\/var\/log\/journal\/%m/d' /usr/lib/tmpfiles.d/systemd.conf
echo "z /var/log/journal/%m 2640 root systemd-journal - -" | sudo tee -a /usr/lib/tmpfiles.d/systemd.conf

sudo sed -i '/\/var\/log\/journal\/%m\/system.journal/d' /usr/lib/tmpfiles.d/systemd.conf
echo "z /var/log/journal/%m/system.journal 0640 root systemd-journal - -" | sudo tee -a /usr/lib/tmpfiles.d/systemd.conf
