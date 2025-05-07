#!/bin/bash
# 💫 fork from https://github.com/JaKooLit 💫 #
# By Gl00ria (https://github.com/Gl00ria) #
# Hyprland Packages #

# edit your packages desired here.
# WARNING! If you remove packages here, dotfiles may not work properly.
# and also, ensure that packages are present in AUR and official Arch Repo

# add packages wanted here
Extra=(
  # --------------------------------------------------- // Security
  #ufw               # ufw (Uncompleted Firewall) pkg
  #apparmor          # LSM (Linux Security Module), by providing MAC (Mandatory Access Control)
  #audit             # apparmor req
  # get desktop notifications on denied actions (for apparmor)
  #python-notify2
  #python-psutil

  # --------------------------------------------------- // GUI Apps/Utils
  #visual-studio-code-bin           # come on :), config == True
  #dolphin                          # kde file manager
  #qt5-imageformats                 # for dolphin image thumbnails
  #ffmpegthumbs                     # for dolphin video thumbnails
  # kde-cli-tools      # for dolphin file type defaults
  # gwenview           # image viewer

  # --------------------------------------------------- // Desktop Integration
  #accountsservice        # d-bus interface for user account query & implementation
  #gst-libav              # multimedia graph framework (libav plugin)
  #libdvdcss              # DVD decrybtion
  #libgsf                 # I/O lib for structured file format
  #libopenraw             # decoding raw files

  # --------------------------------------------------- // Theming
  #kvantum-qt5                                         # svg based qt5 theme engine
  #qt5-wayland                                         # wayland support in qt5
  #qt6-wayland                                         # wayland support in qt6

  # --------------------------------------------------- // Window Manager
  # grimblast-git # screenshot tool
  # clipse        # clipboard manager
)

hypr_package=(
  #aylurs-gtk-shell
  bc          # calculator
  imagemagick # for image processing
  jq          # for json processing
  kitty       # terminal emulator, config == changed
  kvantum     # svg based qt6 theme engine
  libspng
  # nano
  network-manager-applet # network manager system tray utility
  python-requests
  python-pyquery
  qt5ct # qt5 configuration tool
  qt6ct # qt6 configuration tool
  qt6-svg
  rofi-wayland # application launcher, config == True
  swaync       # notification center, config == True
  swww         # wallpaper, config == True
  waybar       # system bar, config == True
  wallust      # generate color from image 'AUR'
  wlogout      # logout menu, config == True
  xdg-user-dirs
  xdg-utils
  # yad # dotfile manager
)

# the following packages can be deleted. however, dotfiles may not work properly
hypr_package_2=(
  brightnessctl # screen brightness control
  cava          # audio visualizer
  loupe         # image viewer
  fastfetch     # system information fetch tool
)

# List of packages to uninstall as it conflicts some packages
uninstall=(
  aylurs-gtk-shell
  dunst
  cachyos-hyprland-settings
  mako
  rofi
  wallust-git
  rofi-lbonn-wayland
  rofi-lbonn-wayland-git
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
LOG="Install-Logs/install-$(date +%d-%H%M%S)_hypr-pkgs.log"

# conflicting packages removal
overall_failed=0
printf "\n%s - ${SKY_BLUE}Removing some packages${RESET} as it conflicts with Gl00ria's DotKool-remix for Hyprland \n" "${NOTE}"
for PKG in "${uninstall[@]}"; do
  uninstall_package "$PKG" 2>&1 | tee -a "$LOG"
  if [ $? -ne 0 ]; then
    overall_failed=1
  fi
done

if [ $overall_failed -ne 0 ]; then
  echo -e "${ERROR} Some packages failed to uninstall. Please check the log."
fi

printf "\n%.0s" {1..1}

# Installation of main components
printf "\n%s - Installing ${SKY_BLUE}Gl00ria's DotKool-remix for Hyprland necessary packages${RESET} .... \n" "${NOTE}"

for PKG1 in "${hypr_package[@]}" "${hypr_package_2[@]}" "${Extra[@]}"; do
  install_package "$PKG1" "$LOG"
done

printf "\n%.0s" {1..2}
