!/bin/bash

# Script to install 3rd party software that I use regularly.
sudo apt clean
sudo apt update

#sudo add-apt-repository -y ppa:mozillateam/ppa
#sudo apt-key adv --recv-key --keyserver keyserver.ubuntu.com 1015216E75198A89
#sudo add-apt-repository -y ppa:libreoffice/ppa
#sudo apt-key adv --recv-key --keyserver keyserver.ubuntu.com 83FBA1751378B444
#deb http://ppa.launchpad.net/libreoffice/libreoffice-7-0/ubuntu focal main 
#deb-src http://ppa.launchpad.net/libreoffice/libreoffice-7-0/ubuntu focal main 

# Remove Fluendo mp3 codec if installed.
sudo apt purge -yyqq gstreamer1.0-fluendo-mp3

# Check if some apps are already installed before installing them.
# Package management
dpkg -l | grep -qw muon || sudo apt install -yyq muon
dpkg -l | grep -qw aptitude || sudo apt install -yyq aptitude
dpkg -l | grep -qw tasksel || sudo apt install -yyq tasksel
dpkg -l | grep -qw gdebi || sudo apt install -yyq gdebi
dpkg -l | grep -qw synaptic || sudo apt install -yyq synaptic
# System 'maintenance'
dpkg -l | grep -qw fslint || sudo apt install -yyq fslint
dpkg -l | grep -qw efibootmgr || sudo apt install -yyq efibootmgr
dpkg -l | grep -qw htop || sudo apt install -yyq htop
# Tools/customization
dpkg -l | grep -qw terminator || sudo apt install -yyq terminator
dpkg -l | grep -qw apt-transport-https || sudo apt install -yyq apt-transport-https
dpkg -l | grep -qw curl || sudo apt install -yyq curl
dpkg -l | grep -qw grub-customizer || sudo apt install -yyq grub-customizer
dpkg -l | grep -qw cmatrix || sudo apt install -yyq cmatrix
dpkg -l | grep -qw git || sudo apt install -yyq git
dpkg -l | grep -qw calibre || sudo apt install -yyq calibre
dpkg -l | grep -qw thunderbird || sudo apt install -yyq thunderbird
dpkg -l | grep -qw software-properties-common || sudo apt install -yyq software-properties-common
# KDE
#dpkg -l | grep -qw dolphin || sudo apt install -yyq dolphin
#dpkg -l | grep -qw kdeconnect || sudo apt install -yyq kdeconnect
#dpkg -l | grep -qw muon || sudo apt install -yyq muon

# Kernels/drivers
# Liquorix
curl 'https://liquorix.net/add-liquorix-repo.sh' | sudo bash
sudo apt-get install linux-image-liquorix-amd64 linux-headers-liquorix-amd64
# Ubuntu Kernel update utility- possibly defunct
#sudo add-apt-repository -y ppa:teejee2008/ppa
#sudo apt update
#sudo apt install ukuu
# Nvidia
#sudo add-apt-repository ppa:graphics-drivers/ppa
#sudo ubuntu-drivers autoinstall || sudo apt upgrade -y && sudo ubuntu-drivers autoinstall
# Radeon
# Install OpenRazer drivers and interface.
#sudo echo 'deb http://download.opensuse.org/repositories/hardware:/razer/Debian_9.0/ /' > /etc/apt/sources.list.d/hardware:razer.list#sudo add-apt-repository ppa:openrazer/stable
#echo "deb http://ppa.launchpad.net/polychromatic/stable/ubuntu xenial main" | sudo tee -a /etc/apt/sources.list.d/polychromatic.list
#sudo apt-key adv --recv-key --keyserver keyserver.ubuntu.com 96B9CD7C22E2C8C5
#sudo aptitude update
#sudo apt install polychromatic -y

# Browsers.
# Brave
curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -
echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update
sudo apt install brave-browser
# Chrome
#wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
#sudo gdebi -n google-chrome-stable_current_amd64.deb
#rm google-chrome-stable_current_amd64.deb

# Remote Access
# TeamViewer
wget https://download.teamviewer.com/download/linux/teamviewer_amd64.deb
sudo apt install ./teamviewer_amd64.deb
rm teamviewer_amd64.deb

# Coding
# Python
# Arduino
# Powershell
# Download the Microsoft repository GPG keys
wget https://packages.microsoft.com/config/debian/10/packages-microsoft-prod.deb
# Register the Microsoft repository GPG keys
sudo dpkg -i packages-microsoft-prod.deb
# Update the list of products
sudo apt-get update
# Install PowerShell
sudo apt-get install -y powershell
# Start PowerShell
#pwsh
# VSCode
sudo wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt update
sudo apt install code

# Notepadqq
#sudo add-apt-repository ppa:notepadqq-team/notepadqq
# above will only work after adding the correct signing key - installs latest ubuntu version
# below works as is -installs ubuntu trusty version
echo "deb http://ppa.launchpad.net/notepadqq-team/notepadqq/ubuntu trusty main" | sudo tee /etc/apt/sources.list.d/notepadqq.list
sudo apt-key adv --recv-key --keyserver keyserver.ubuntu.com 63DE9CD4
sudo apt update
sudo apt install notepadqq
# Brackets
# FreeCAD- temporary placeholder, not technically coding
# Inkscape

# Gaming
# Steam
#sudo add-apt-repository multiverse
#sudo apt update
#sudo apt install steam
# GOG
# Lutris
# DOS Box

# Cloud storage
# OneDrive
# Google Drive
# MEGA Sync
#wget https://mega.nz/linux/MEGAsync/xUbuntu_18.04/amd64/megasync-xUbuntu_18.04_amd64.deb
#sudo gdebi -n megasync-xUbuntu_18.04_amd64.deb
#rm megasync-xUbuntu_18.04_amd64.deb
# Google Photos

#sudo add-apt-repository ppa:webupd8team/y-ppa-manager
#sudo apt-get update
#sudo apt-get install y-ppa-manager
#deb http://ppa.launchpad.net/webupd8team/y-ppa-manager/ubuntu focal main 
#deb-src http://ppa.launchpad.net/webupd8team/y-ppa-manager/ubuntu focal main 



echo "--------------------
-       Done!      -
--------------------
"
