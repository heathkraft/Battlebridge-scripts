!/bin/bash

# Start by adding Debian repos, including non-free and backports.
sudo apt-add-reppsitory 'deb http://ftp.us.debian.org/debian/ buster main contrib non-free'
sudo apt-add-repository 'deb http://ftp.us.debian.org/debian/ buster-updates main contrib non-free'
sudo apt-add-repository 'deb http://ftp.us.debian.org/debian/ buster-proposed-updates main contrib non-free'
sudo apt-add-repository 'deb http://ftp.us.debian.org/debian/ buster-backports main contrib non-free'

# Remove Fluendo mp3 codec if installed.
sudo apt purge -yyqq gstreamer1.0-fluendo-mp3

# Clean apt-cache, refresh, and upgrade all currently installed apps in preparation for the rest of the setup script.
sudo apt clean
sudo apt update
sudo apt full-upgrade -yy

# Run a check on some apps, so that we're not trying to reinstall them.
# Apps that will be needed to complete the script, and package management apps.
dpkg -l | grep -qw software-properties-common || sudo apt install -yyq software-properties-common
dpkg -l | grep -qw apt-transport-https || sudo apt install -yyq apt-transport-https
#dpkg -l | grep -qw aptitude || sudo apt install -yyq aptitude
dpkg -l | grep -qw tasksel || sudo apt install -yyq tasksel
dpkg -l | grep -qw gdebi || sudo apt install -yyq gdebi
dpkg -l | grep -qw curl || sudo apt install -yyq curl
#dpkg -l | grep -qw synaptic || sudo apt install -yyq synaptic
dpkg -l | grep -qw muon || sudo apt install -yyq muon
dpkg -l | grep -qw less || sudo apt install -yyq less
dpkg -l | grep -qw git || sudo apt install -yyq git
sudo dpkg --add-architecture i386
# Other system and settings apps.
dpkg -l | grep -qw grub-customizer || sudo apt install -yyq grub-customizer
dpkg -l | grep -qw efibootmgr || sudo apt install -yyq efibootmgr
dpkg -l | grep -qw terminator || sudo apt install -yyq terminator
dpkg -l | grep -qw latte-dock || sudo apt install -yyq latte-dock
#dpkg -l | grep -qw cmatrix || sudo apt install -yyq cmatrix
dpkg -l | grep -qw ffmpeg || sudo apt install -yyq ffmpeg
dpkg -l | grep -qw fslint || sudo apt install -yyq fslint
dpkg -l | grep -qw htop || sudo apt install -yyq htop

# So far, we've stayed within the Debian ecosystem. But, that ends here.
# From here on, we'll be including outside repos, either for apps not included in Debian repos, or to get more up-to-date versions.

# Kernels/drivers/configuration apps
# Liquorix
curl 'https://liquorix.net/add-liquorix-repo.sh' | sudo bash
sudo apt install linux-image-liquorix-amd64 linux-headers-liquorix-amd64
# Nvidia
#sudo apt install -yyq nvidia-driver
# Radeon
# Keyboard -Ducky One2 config app
# Mouse -Roccat NYTH config app
# Laptop apps
#sudo add-apt-repository ppa:webupd8team/y-ppa-manager
#echo "deb http://ppa.launchpad.net/webupd8team/y-ppa-manager/ubuntu focal main" | sudo tee /etc/apt/sources.list.d/y-ppa-manager.list
#sudo apt-key adv --recv-key --keyserver keyserver.ubuntu.com C2518248EEA14886
#sudo apt update#sudo apt install y-ppa-manager

# Browsers
# Brave
curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -
echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update && sudo apt install -yyq brave-browser
# Chrome
#wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
#sudo gdebi -n google-chrome-stable_current_amd64.deb
#rm google-chrome-stable_current_amd64.deb

# Office apps
dpkg -l | grep -qw calibre || sudo apt install -yyq calibre
echo "deb http://ppa.launchpad.net/mozillateam/ppa/ubuntu focal main" | sudo tee /etc/apt/sources.list.d/mozillateam.list
sudo apt-key adv --recv-key --keyserver keyserver.ubuntu.com 0AB215679C571D1C8325275B9BDB3D89CE49EC21
#dpkg -l | grep -qw thunderbird || sudo apt install -yyq thunderbird

echo "deb http://ppa.launchpad.net/libreoffice/libreoffice-7-0/ubuntu focal main" | sudo tee /etc/apt/sources.list.d/libreoffice7.list
sudo apt-key adv --recv-key --keyserver keyserver.ubuntu.com 36E81C9267FD1383FCC4490983FBA1751378B444

# Remote Access Tools
# TeamViewer
wget https://download.teamviewer.com/download/linux/teamviewer_amd64.deb
sudo apt install ./teamviewer_amd64.deb
rm teamviewer_amd64.deb
#remmina
#ssh

# Cloud storage/sync
# OneDrive
# Google Drive
# MEGA Sync
# Google Photos

# Project development
dpkg -l | grep -qw freecad || sudo apt install -yyq freecad
sudo apt install -yyq kicad 
# Python
sudo apt install -yyq python3 python3-pip
# Arduino
# Powershell
wget https://packages.microsoft.com/config/debian/10/packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
rm packages-microsoft-prod.deb
sudo apt update && sudo apt install -yyq powershell
# VSCode
sudo wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt update && sudo apt install -yyq code
# Notepadqq
#sudo add-apt-repository ppa:notepadqq-team/notepadqq
# above will only work after finding the correct signing key - installs latest ubuntu version 2.0beta
# below works as is -installs ubuntu trusty version 1.4stable
echo "deb http://ppa.launchpad.net/notepadqq-team/notepadqq/ubuntu trusty main" | sudo tee /etc/apt/sources.list.d/notepadqq.list
sudo apt-key adv --recv-key --keyserver keyserver.ubuntu.com 63DE9CD4
sudo apt update && sudo apt install -yyq notepadqq
# Brackets
#https://github.com/adobe/brackets/releases/download/release-1.14.1/Brackets.Release.1.14.1.64-bit.deb
#sudo add-apt-repository ppa:webupd8team/brackets
#sudo apt update#sudo apt install brackets

# Multimedia
# Spotify
#curl -sS https://download.spotify.com/debian/pubkey.gpg | sudo apt-key add - 
#curl -sS https://download.spotify.com/debian/pubkey_0D811D58.gpg | sudo apt-key add - 
#echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
#sudo apt update && sudo apt install -yyq spotify-client
sudo apt install -yyq vlc
#clementine/strawberry

# 'Graphic' design - Audio/Video editing
# Kdenlive
#echo "deb http://ppa.launchpad.net/kdenlive/kdenlive-stable/ubuntu focal main" | sudo tee /etc/apt/sources.list.d/kdenlive.list
#sudo apt-key adv --recv-key --keyserver keyserver.ubuntu.com A59E5EBFCCC61564D6D4365B2763B0EE7709FE97
#sudo apt update && sudo apt install -yyq kdenlive

# OBS
#echo "deb http://ppa.launchpad.net/obsproject/obs-studio/ubuntu focal main" | sudo tee /etc/apt/sources.list.d/obs-studio.list
#sudo apt-key adv --recv-key --keyserver keyserver.ubuntu.com BC7345F522079769F5BBE987EFC71127F425E228
#sudo add-apt-repository ppa:obsproject/obs-studio
#sudo apt update && sudo apt install -yyq obs-studio

dpkg -l | grep -qw inkscape || sudo apt install -yyq inkscape
#audacity





# Gaming
# Steam
#sudo apt install steam
# GOG
# Lutris
#wget https://download.opensuse.org/repositories/home:/strycore/Debian_9.0/Release.key
#sudo apt-key add Release.key
#echo "deb http://download.opensuse.org/repositories/home:/strycore/Debian_9.0/ ./" | sudo tee /etc/apt/sources.list.d/lutris.list
#sudo apt install -yyq lutris
# DOS Box






#curl -s https://updates.signal.org/desktop/apt/keys.asc | sudo apt-key add -
#echo "deb [arch=amd64] https://updates.signal.org/desktop/apt xenial main" | sudo tee -a /etc/apt/sources.list.d/signal-xenial.list
#sudo apt update && sudo apt install signal-desktop


sudo apt full-upgrade -yy
sudo apt autoremove -yy

sudo apt autoclean


echo "-------------------"
echo "- Setup Complete! -"
echo "-------------------"