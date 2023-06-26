#!/bin/bash

check_ubuntu_world_writable_files() {
    world_writable_files=$(find / -xdev -type f -perm -o+w 2>/dev/null)

    if [[ -n "$world_writable_files" ]]; then
        echo "World-writable files found:"
        echo "$world_writable_files"
        echo ""
        echo "To remediate the issue, review the listed files and adjust their permissions as necessary."
    else
        echo "No world-writable files found."
    fi
}

check_alma_world_writable_files() {
    world_writable_files=$(find / -xdev -type f -perm -o+w 2>/dev/null)

    if [[ -n "$world_writable_files" ]]; then
        echo "World-writable files found:"
        echo "$world_writable_files"
        echo ""
        echo "To remediate the issue, review the listed files and adjust their permissions as necessary."
    else
        echo "No world-writable files found."
    fi
}

# Check the operating system
if [[ -f /etc/os-release ]]; then
    . /etc/os-release
    os_name="${ID,,}"
else
    echo "Unable to determine the operating system."
    exit 1
fi

# Run the appropriate function based on the operating system
if [[ "$os_name" == "ubuntu" ]]; then
    check_ubuntu_world_writable_files
elif [[ "$os_name" == "almalinux" ]]; then
    check_alma_world_writable_files
else
    echo "Unsupported operating system: $os_name"
    exit 1
fi
