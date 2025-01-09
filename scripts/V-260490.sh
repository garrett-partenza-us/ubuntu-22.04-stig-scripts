#!/bin/bash

# Set permissions on journal and log directories

# Delete and append the first line
sudo sed -i '/\/run\/log\/journal/d' /etc/tmpfiles.d/systemd.conf
sudo echo "z /run/log/journal 2750 root systemd-journal - -" | tee -a /etc/tmpfiles.d/systemd.conf

# Delete and append the second line
sudo sed -i '/\/run\/log\/journal\/%m/d' /etc/tmpfiles.d/systemd.conf
sudo echo "Z /run/log/journal/%m ~2750 root systemd-journal - -" | tee -a /etc/tmpfiles.d/systemd.conf

# Delete and append the third line
sudo sed -i '/\/var\/log\/journal/d' /etc/tmpfiles.d/systemd.conf
sudo echo "z /var/log/journal 2750 root systemd-journal - -" | tee -a /etc/tmpfiles.d/systemd.conf

# Delete and append the fourth line
sudo sed -i '/\/var\/log\/journal\/%m/d' /etc/tmpfiles.d/systemd.conf
sudo echo "z /var/log/journal/%m 2750 root systemd-journal - -" | tee -a /etc/tmpfiles.d/systemd.conf

# Delete and append the fifth line
sudo sed -i '/\/var\/log\/journal\/%m\/system.journal/d' /etc/tmpfiles.d/systemd.conf
sudo echo "z /var/log/journal/%m/system.journal 0750 root systemd-journal - -" | tee -a /etc/tmpfiles.d/systemd.conf

