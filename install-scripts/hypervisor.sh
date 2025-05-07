#!/bin/bash
# 💫 fork from https://github.com/JaKooLit 💫 #
# Added by Gl00ria (https://github.com/Gl00ria) #
# Hypervisor App #

hy_tools=(
  vmware-workstation
  # virtualbox
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
LOG="Install-Logs/install-$(date +%d-%H%M%S)_hypervisor.log"

# Hypervisor
printf "${NOTE} Downloading, Installing & Configuring ${SKY_BLUE}Hypervisor App/s${RESET}...\n"
for HTOOLS in "${hy_tools[@]}"; do
  install_package "$HTOOLS" "$LOG"
done

# Activating VMware services (Networks & USB)
printf " Activating ${YELLOW}VmWare${RESET} Services...\n"
sudo systemctl enable --now vmware-networks.service 2>&1 | tee -a "$LOG"
sudo systemctl enable --now vmware-usbarbitrator.service 2>&1 | tee -a "$LOG"

printf "\n%.0s" {1..2}
