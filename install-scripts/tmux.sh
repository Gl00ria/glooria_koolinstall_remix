#!/bin/bash
# 💫 fork from https://github.com/JaKooLit 💫 #
# Added by Gl00ria (https://github.com/Gl00ria) #
# Tmux #

t_mux=(
  tmux # config == true
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
LOG="Install-Logs/install-$(date +%d-%H%M%S)_tmux.log"

# Text Editors
printf "${NOTE} Downloading, Installing & Configuring ${SKY_BLUE}Tmux${RESET} Terminal Multiplixir...\n"
for TM in "${t_mux[@]}"; do
  install_package "$TM" "$LOG"
done

# My personal tmux config
if [[ -d "$HOME/.tmux/" ]]; then
  printf "${NOTE}Backing-up your${SKY_BLUE}Tmux${RESET} Config...\n"
  mv ~/.tmux/ ~/.tmux_$(date +'%H:%M:%S_%d-%m-%Y')
  mv ~/.tmux.conf ~/.tmux.conf_$(date +'%H:%M:%S_%d-%m-%Y')
  printf "${NOTE}Downloading ${SKY_BLUE}Tmux Plugin manager${RESET}...\n"
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
else
  printf "${NOTE}Setting up${SKY_BLUE} Tmux${RESET} Config...\n"
  mv assets/.tmux.conf "$HOME/"
fi

printf "\n%.0s" {1..2}
