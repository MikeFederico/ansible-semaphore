#!/bin/bash

# Check if script is run as root
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

# Install sudo if not already installed
#apt-get update
apt-get install -y sudo

# Create a user named 'yoda'
username="yoda"
password="dagobah"  # You should change this to a secure password

useradd -m -s /bin/bash "$username"
echo "$username:$password" | chpasswd

# Add 'yoda' to the sudo group
usermod -aG sudo "$username"

echo "User 'yoda' has been created and added to the sudoers group."
echo "Please change 'yoda's password using 'passwd yoda' command after first login."

exit 0
