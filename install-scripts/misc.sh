#!/bin/bash
# 💫 fork from https://github.com/JaKooLit 💫 #
# Added by Gl00ria (https://github.com/Gl00ria) #
# Misc Apps/Tools #

misc=(
  ncdu # disk usage analyzer
  # gparted # come on :)
  partitionmanager # same as gparted
  wget             # come on :)
  curl             # come on :)
  # udiskie # manage removable media
  # polkit-gnome # authentication agent
  parallel   # for parallel processing
  libnotify  # for notifications
  mlocate    # mergeing (locate/updatedb)
  tldr       # :) for YOU, ME & US
  gtrash-bin # safer rm
  rsync      # the fantastical fantasticoo
  yt-dlp     # download from YouTube --> alias == True
  # gnome-system-monitor # GUI system monitor
  plasma-systemmonitor # GUI system monitor
  btop                 # TUI system monitor config == True
  nwg-look             # gtk editor
  nwg-displays
  qalculate-gtk
  umockdev # record hardware devices for bug reports
  wev      # shows wayland events (keyboard) eg..  (wev | grep -i scroll)
  # usb_modeswitch # activating swichable USB devices
  #rmlint                          # finds space waste and other broken things on your filesystem
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
LOG="Install-Logs/install-$(date +%d-%H%M%S)_misc.log"

# Misc Apps/Tools
printf "${NOTE} Downloading, Installing & Configuring ${SKY_BLUE}Misc Apps/Tools${RESET}...\n"
for MTOOLS in "${misc[@]}"; do
  install_package "$MTOOLS" "$LOG"
done

printf "\n%.0s" {1..2}
