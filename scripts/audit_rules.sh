#!/bin/bash

# Define the audit rules file
AUDIT_RULES_FILE="/etc/audit/rules.d/stig.rules"

# Define an array of audit rules
AUDIT_RULES=(
    "-a always,exit -F path=/usr/bin/mount -F perm=x -F auid>=1000 -F auid!=unset -k privileged-mount"
    "-a always,exit -F path=/usr/bin/chacl -F perm=x -F auid>=1000 -F auid!=unset -k perm_chng"
		"-a always,exit -F path=/usr/bin/chsh -F perm=x -F auid>=1000 -F auid!=unset -k priv_cmd "
		"-a always,exit -F path=/usr/bin/crontab -F perm=x -F auid>=1000 -F auid!=unset -k privileged-crontab"
		"-a always,exit -F path=/usr/bin/gpasswd -F perm=x -F auid>=1000 -F auid!=unset -k privileged-gpasswd "
		"-w /sbin/modprobe -p x -k modules"
		"-a always,exit -F path=/usr/bin/mount -F perm=x -F auid>=1000 -F auid!=unset -k privileged-mount"
		"-a always,exit -F path=/usr/sbin/pam_timestamp_check -F perm=x -F auid>=1000 -F auid!=unset -k privileged-pam_timestamp_check"
		"-a always,exit -F path=/usr/bin/ssh-agent -F perm=x -F auid>=1000 -F auid!=unset -k privileged-ssh"
		"-a always,exit -F path=/bin/su -F perm=x -F auid>=1000 -F auid!=unset -k privileged-priv_change"
		"-a always,exit -F path=/usr/bin/umount -F perm=x -F auid>=1000 -F auid!=unset -k privileged-umount"
		"-a always,exit -F path=/usr/sbin/usermod -F perm=x -F auid>=1000 -F auid!=unset -k privileged-usermod"
		"-w /etc/gshadow -p wa -k usergroup_modification"
		"-w /etc/security/opasswd -p wa -k usergroup_modification"
		"-a always,exit -F arch=b32 -S chown,fchown,fchownat,lchown -F auid>=1000 -F auid!=unset -k perm_chng -a always,exit -F arch=b64 -S chown,fchown,fchownat,lchown -F auid>=1000 -F auid!=unset -k perm_chng"
		"-w /etc/shadow -p wa -k usergroup_modification"
		"-a always,exit -F arch=b32 -S chown,fchown,fchownat,lchown -F auid>=1000 -F auid!=unset -k perm_chng -a always,exit -F arch=b64 -S chown,fchown,fchownat,lchown -F auid>=1000 -F auid!=unset -k perm_chng"
		" -a always,exit -F arch=b32 -S creat,open,openat,open_by_handle_at,truncate,ftruncate -F exit=-EPERM -F auid>=1000 -F auid!=unset -k perm_access -a always,exit -F arch=b32 -S creat,open,openat,open_by_handle_at,truncate,ftruncate -F exit=-EACCES -F auid>=1000 -F auid!=unset -k perm_access -a always,exit -F arch=b64 -S creat,open,openat,open_by_handle_at,truncate,ftruncate -F exit=-EPERM -F auid>=1000 -F auid!=unset -k perm_access -a always,exit -F arch=b64 -S creat,open,openat,open_by_handle_at,truncate,ftruncate -F exit=-EACCES -F auid>=1000 -F auid!=unset -k perm_access"
		"-a always,exit -F arch=b64 -S unlink,unlinkat,rename,renameat,rmdir -F auid>=1000 -F auid!=unset -k delete -a always,exit -F arch=b32 -S unlink,unlinkat,rename,renameat,rmdir -F auid>=1000 -F auid!=unset -k delete"
		"-w /var/log/journal -p wa -k systemd_journal"
		"-w /var/log/wtmp -p wa -k logins"
		"-w /var/log/faillog -p wa -k logins"
		"-w /var/log/lastlog -p wa -k logins"
		"-w /etc/sudoers.d -p wa -k privilege_modification"
		"-w /var/log/sudo.log -p wa -k maintenance"
)

# Loop over each rule and add it
for AUDIT_RULE in "${AUDIT_RULES[@]}"; do 
    # Add the new rule to the audit file
    echo "$AUDIT_RULE" | sudo tee -a "$AUDIT_RULES_FILE" > /dev/null
done

# Reload the audit rules
sudo augenrules --load

# Completion message
echo "Audit rules have been added and audit rules reloaded."
