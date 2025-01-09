#!/bin/bash

# Set root owner on system logs

sudo sed -i '/\/run\/log\/journal/d' /usr/lib/tmpfiles.d/systemd.conf
echo "z /run/log/journal 2640 root systemd-journal - -" | sudo tee -a /usr/lib/tmpfiles.d/systemd.conf

sudo sed -i '/\/var\/log\/journal/d' /usr/lib/tmpfiles.d/systemd.conf
echo "z /var/log/journal 2640 root systemd-journal - -" | sudo tee -a /usr/lib/tmpfiles.d/systemd.conf
