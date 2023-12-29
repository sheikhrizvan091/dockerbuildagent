#!/bin/bash -e
################################################################################
##  File:  azure-cli.sh
##  Desc:  Installed Azure CLI (az)
################################################################################
 
# Install Azure CLI (instructions taken from https://docs.microsoft.com/en-us/cli/azure/install-azure-cli)
# curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
# echo "azure-cli https://docs.microsoft.com/en-us/cli/azure/install-azure-cli-linux?pivots=apt" >> $HELPER_SCRIPTS/apt-sources.txt
# rm -f /etc/apt/sources.list.d/azure-cli.list
# rm -f /etc/apt/sources.list.d/azure-cli.list.save
 
# invoke_tests "CLI.Tools" "Azure CLI"


# Install Azure CLI
Invoke-WebRequest -Uri https://aka.ms/InstallAzureCLIDeb -OutFile install-azure-cli.sh
sudo bash ./install-azure-cli.sh

# Add source information to apt-sources.txt
Add-Content -Path "$env:HELPER_SCRIPTS/apt-sources.txt" -Value "azure-cli https://docs.microsoft.com/en-us/cli/azure/install-azure-cli-linux?pivots=apt"

# Remove existing Azure CLI source lists
Remove-Item -Path "/etc/apt/sources.list.d/azure-cli.list" -ErrorAction SilentlyContinue
Remove-Item -Path "/etc/apt/sources.list.d/azure-cli.list.save" -ErrorAction SilentlyContinue

# Invoke tests (assuming there's a function or script named invoke_tests)
Invoke-Expression -Command "invoke_tests 'CLI.Tools' 'Azure CLI'"
