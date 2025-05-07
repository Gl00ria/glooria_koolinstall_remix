#!/bin/bash
# 💫 fork from https://github.com/JaKooLit 💫 #
# Added by Gl00ria (https://github.com/Gl00ria) #
# Documents Reader #

doc_reader=(
  zathura # terminal pdf reader
  zathura-pdf-poppler
  libreoffice-fresh # Microsoft Offics's alternative
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
LOG="Install-Logs/install-$(date +%d-%H%M%S)_doc_reader.log"

# Documents Reader
printf "${NOTE} Downloading & Installing ${SKY_BLUE}Documents Readers${RESET} Packages...\n"
for DOCR in "${doc_reader[@]}"; do
  install_package "$DOCR" "$LOG"
done

printf "\n%.0s" {1..2}
