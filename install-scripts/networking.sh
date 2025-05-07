#!/bin/bash
# 💫 fork from https://github.com/JaKooLit 💫 #
# Added by Gl00ria (https://github.com/Gl00ria) #
# Netowrking Tools #

net_tools=(
  networkmanager         # network manager
  networkmanager-openvpn # OpenVPN plugin for 'networkmanager'
  openssh                # come on :)
  openvpn                # VPN
  #ntp                                 # Network Time Protocol
  #dnsmasq                             # DNS forwarder & DHCP server
  #dhclient                            # DHCP client
  #ethtool                             # util to control netwrok drivers & hardware
  #modemmanager                        # mobile broadband modem management service
  #nss-mdns                            # host-name resolution via (mDNS)
  #net-tools                           # host-name resolution via (mDNS)
  #b43-fwcutter                        # firmware extractor for (b43) kernel module
  #iwd                                 # internet wireless daemon
  #wpa_supplicant                      # util for WPA wirless network
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
LOG="Install-Logs/install-$(date +%d-%H%M%S)_networking.log"

# Networking Tools
printf "${NOTE} Downloading & Installing ${SKY_BLUE}Networking${RESET} Tools...\n"
for NTOOLS in "${net_tools[@]}"; do
  install_package "$NTOOLS" "$LOG"
done

printf "\n%.0s" {1..2}
