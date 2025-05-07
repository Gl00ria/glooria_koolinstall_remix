#!/bin/bash
# 💫 fork from https://github.com/JaKooLit 💫 #
# Added by Gl00ria (https://github.com/Gl00ria) #
# File system Support Tools #

fs_tools=(
  ntfs-3g     # NTFS filesystem driver and utilities
  exfat-utils # to access 'exFAT' file system
  nfs-utils   # Network fs
  mtools      # access (MS-DOS) disks
  efitools    # UEFI secure boot platforms
  gvfs        # virtual fs for GIO
  gvfs-mtp
)

## WARNING: DO NOT EDIT BEYOND THIS LINE IF YOU DON'T KNOW WHAT YOU ARE DOING! ##
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Change the working directory to the parent directory of the script
PARENT_DIR="$SCRIPT_DIR/.."
cd "$PARENT_DIR" || {
  echo "${ERROR} Failed to change directory to $PARENT_DIR"
  exit 1
}

# Source the global functions script
if ! source "$(dirname "$(readlink -f "$0")")/Global_functions.sh"; then
  echo "Failed to source Global_functions.sh"
  exit 1
fi

# Set the name of the log file to include the current date and time
LOG="Install-Logs/install-$(date +%d-%H%M%S)_file_sys.log"

# File system
printf "${NOTE} Downloading & Installing ${SKY_BLUE}File System Support${RESET} Tools...\n"
for FSTOOLS in "${fs_tools[@]}"; do
  install_package "$FSTOOLS" "$LOG"
done

printf "\n%.0s" {1..2}
