!/bin/bash

# Script to install 3rd party software that I use regularly.
sudo apt clean
sudo apt update

#sudo add-apt-repository -y ppa:mozillateam/ppa
#sudo add-apt-repository -y ppa:libreoffice/ppa

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
dpkg -l | grep -qw grub-configurator || sudo apt install -yyq grub-configurator
dpkg -l | grep -qw cmatrix || sudo apt install -yyq cmatrix
dpkg -l | grep -qw git || sudo apt install -yyq git
dpkg -l | grep -qw calibre || sudo apt install -yyq calibre
dpkg -l | grep -qw thunderbird || sudo apt install -yyq thunderbird
# KDE
#dpkg -l | grep -qw dolphin || sudo apt install -yyq dolphin
#dpkg -l | grep -qw kdeconnect || sudo apt install -yyq kdeconnect
#dpkg -l | grep -qw muon || sudo apt install -yyq muon
#dpkg -l | grep -qw muon || sudo apt install -yyq muon

# Custom Kernels/drivers
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

# Install Browsers.
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
# VSCode
# Notepadqq
# FreeCAD- temporary placeholder, not technically coding

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




echo "--------------------
-       Done!      -
--------------------
"
