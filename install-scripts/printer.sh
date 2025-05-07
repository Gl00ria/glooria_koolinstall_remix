#!/bin/bash
# 💫 fork from https://github.com/JaKooLit 💫 #
# Added by Gl00ria (https://github.com/Gl00ria) #
# Printer/Scanner #

print_tools=(
  hplip         # Drivers for (DeskJet, OfficeJet, Photosmart, Busseniss Inject)
  gutenprint    # printer drivers for POSIX sys
  print-manager # managing pring jobs & printers
  libcups
  cups
  cups-browsed          # browse the network for remote cups
  bluez-cups            # CUPS printer backend for Bluetooth printers
  system-config-printer # CPUS printer config tools & staus applet
  splix                 # CUPS drivers for (Samsung Printer Language) printers
  cups-filters
  foomatic-db-engine          #  generate print queues & handle jobs
  foomatic-db                 # collected knowledge about printers, drivers, and driver options
  foomatic-db-nonfree         # non-free ^^^^^^^^
  foomatic-db-gutenprint-ppds # simplified prebuilt ppd files
  foomatic-db-ppds            # PPDs from printer manufacturers
  foomatic-db-nonfree-ppds    # non-free ^^^^^^^^^^^^^
  ghostscript                 #  interpreter for 'PostScript' language
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
LOG="Install-Logs/install-$(date +%d-%H%M%S)_printer.log"

# Printer/Scanner
printf "${NOTE} Downloading & Installing ${SKY_BLUE}Printer/Scanner${RESET} Packages...\n"
for PTOOL in "${print_tools[@]}"; do
  install_package "$PTOOL" "$LOG"
done

printf "\n%.0s" {1..2}
