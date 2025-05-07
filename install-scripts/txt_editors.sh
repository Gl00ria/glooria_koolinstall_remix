#!/bin/bash
# 💫 fork from https://github.com/JaKooLit 💫 #
# Added by Gl00ria (https://github.com/Gl00ria) #
# Text Editor #

t_editor=(
  vim    # come on :)
  neovim # come on :)
  cmake
  ttf-cascadia-code-nerd # font for nvim
  clang                  # required for treesitter parsers
  python-pynvim          # neovim python's support
  neovide                # C00L GUI for neovim
  # gedit         # gnome's txt editor
  # mousepad # txt editor
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
LOG="Install-Logs/install-$(date +%d-%H%M%S)_txt_editors.log"

# Text Editors
printf "${NOTE} Downloading, Installing & Configuring ${SKY_BLUE}Txt Editors${RESET} Packages...\n"
for TED in "${t_editor[@]}"; do
  install_package "$TED" "$LOG"
done

# My personal nvim config
if [[ -d ~/.config/nvim/ ]]; then
  printf "${NOTE}Backing-up your${SKY_BLUE}Nvim${RESET} Config...\n"
  mv ~/.config/nvim/ ~/.config/nvim_$(date +'%H:%M:%S_%d-%m-%Y')
  printf "${NOTE}Downloading my${SKY_BLUE} Nvim${RESET} Config...\n"
  git clone https://github.com/Gl00ria/nvim.git ~/.config/nvim
else
  printf "${NOTE}Downloading my${SKY_BLUE} Nvim${RESET} Config...\n"
  git clone https://github.com/Gl00ria/nvim.git ~/.config/nvim
fi

printf "${NOTE} Copying ${SKY_BLUE}.editorconfig${RESET}...\n"
cp -r 'assets/.editorconfig' ~/

printf "\n%.0s" {1..2}
