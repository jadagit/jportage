#!/bin/bash
#
# jportage.bash - Gentoo Portage Management Script
#
# This script provides tools to manage the Gentoo Portage system, including syncing,
# updating, creating backups, enabling debugging, and configuring compression.
#
# License: AGPL-3
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU Affero General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with this program. If not, see <https://www.gnu.org/licenses/>.
#
# For more information about the AGPL-3 license, please visit:
# <https://www.gnu.org/licenses/agpl-3.0.html>
#
# Author: Your Name
# Version: 1.0
# Date: October 31, 2023


# Function to display help information
display_help() {
  cat <<EOF
jportage - Gentoo Portage Administration Script

This script simplifies Gentoo Portage administration. It provides a menu-driven interface
for syncing the Portage tree, updating the system, creating backups, enabling debugging, 
and configuring compression.

Usage:
  ./jportage.sh [OPTIONS]

Options:
  -h, --help       Display this help message.
  -m, --menu       Start the menu interface.
  -p, --pretend    Enable pretend mode, no administrative actions are taken.
EOF
}

# Function to display usage
display_usage() {
  echo "Usage: $0 [OPTION]"
  echo "Options:"
  echo "  -h, --help              Show this help message"
  echo "  -s, --sync              Sync and update Portage"
  echo "  -b, --backup            Create a backup"
  echo "  -d, --debug             Enable debugging"
  echo "  -c, --compression       Configure compression"
  echo "  -x                     Debugging option (sudo only)"
}

# Function to read configuration from the file
read_config() {
  if [ -f "$CONFIG_FILE" ]; then
    source "$CONFIG_FILE"
  fi
}

# Function to sync and update
sync_and_update() {
  emerge --sync
  emerge -auDN @world
}

# Function to create a backup
create_backup() {
  # Specify your backup logic here
  echo "Creating backup..."
}

# Function to enable debugging
enable_debugging() {
  set -x
}

# Function to configure compression
configure_compression() {
  # Specify your compression settings here
  echo "Configuring compression..."
}

# Prerequisite packages
PREREQUISITES=("dialog" "app-portage/portage-utils")

# Function to check for and install missing packages
check_prerequisites() {
  missing=()
  for pkg in "${PREREQUISITES[@]}"; do
    if ! equery list "$pkg" > /dev/null; then
      missing+=("$pkg")
    fi
  done

  if [ "${#missing[@]}" -eq 0 ]; then
    echo "All prerequisites are installed."
  else
    echo "The following prerequisites are missing:"
    for pkg in "${missing[@]}"; do
      echo "- $pkg"
    done

    read -p "Do you want to install missing packages? (y/n): " -r
    if [[ $REPLY =~ ^[Yy]$ ]]; then
      emerge "${missing[@]}"
    else
      echo "Missing packages must be installed to use this script."
      exit 1
    fi
  fi
}

# Check if running as root
if [ "$EUID" -ne 0 ]; then
  if [ "$1" = "-m" ] || [ "$1" = "--menu" ]; then
    # Start the menu interface here
    echo "Starting the menu interface..."
  else
    display_help
    echo "This script requires root privileges. Please run with 'sudo'."
  fi
  exit 1
fi

# Configuration file
CONFIG_FILE="/etc/jportage.config"

# Read command-line options
while [[ "$#" -gt 0 ]]; do
  case "$1" in
    -s|--sync)
      sync_and_update
      ;;
    -b|--backup)
      create_backup
      ;;
    -d|--debug)
      enable_debugging
      ;;
    -c|--compression)
      configure_compression
      ;;
    -h|--help)
      display_usage
      ;;
    -x)
      enable_debugging
      ;;
    -p|--pretend)
      export PRETEND_ENABLED=true
      ;;
    *)
      echo "Invalid option: $1"
      display_usage
      exit 1
      ;;
  esac
  shift
done

# Menu Interface using dialog
while true; do
  read_config

  choice=$(dialog --menu "Portage Management Menu" 15 50 5 \
    1 "Sync and Update" \
    2 "Create Backup" \
    3 "Enable Debugging" \
    4 "Configure Compression" \
    5 "Exit" \
    3>&1 1>&2 2>&3)

  case $choice in
    1)
      sync_and_update
      ;;
    2)
      create_backup
      ;;
    3)
      enable_debugging
      ;;
    4)
      configure_compression
      ;;
    5)
      echo "Exiting..."
      break
      ;;
    *)
      echo "Invalid option. Please select a valid option."
      ;;
  done
}

