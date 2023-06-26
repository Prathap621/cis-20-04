#!/bin/bash

# Check if the OS is Ubuntu
if [[ -f /etc/lsb-release && $(grep -c "Ubuntu" /etc/lsb-release) -gt 0 ]]; then
    # Enable rsyslog service
    sudo systemctl enable rsyslog
    echo "rsyslog service has been enabled."
elif [[ -f /etc/os-release && $(grep -c "AlmaLinux" /etc/os-release) -gt 0 ]]; then
    # Enable rsyslog service
    sudo systemctl enable rsyslog
    echo "rsyslog service has been enabled."
else
    echo "Unsupported operating system."
    exit 1
fi
