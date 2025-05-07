#!/bin/bash
# 💫 fork from https://github.com/JaKooLit 💫 #
# Added by Gl00ria (https://github.com/Gl00ria) #
# Git Tools #

git_tools=(
  git
  lazygit       # awesome TUI for git, config == True
  diff-so-fancy # syntax-highlihgting pager
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
LOG="Install-Logs/install-$(date +%d-%H%M%S)_git.log"

# Git tools
printf "${NOTE} Downloading & Installing ${SKY_BLUE}Git${RESET} Packages...\n"
for GTOOL in "${git_tools[@]}"; do
  install_package "$GTOOL" "$LOG"
done

printf "${NOTE} Copying ${SKY_BLUE}.gitconfig${RESET}...\n"
cp -r 'assets/.gitconfig' ~/

printf "\n%.0s" {1..2}
