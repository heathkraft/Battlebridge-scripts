!/bin/bash

# Remove Fluendo mp3 codec if installed.
#sudo apt purge -yyqq gstreamer1.0-fluendo-mp3

# Clean apt-cache, refresh, and upgrade all currently installed apps in preparation for the rest of the setup script.
sudo apt clean
sudo apt update
sudo apt full-upgrade -yy

# Run a check on some apps, so that we're not trying to reinstall them.
# Apps that will be needed to complete the script, and package management apps.
#dpkg -l | grep -qw software-properties-common || sudo apt install -yyq software-properties-common
dpkg -l | grep -qw apt-transport-https || sudo apt install -yyq apt-transport-https
#dpkg -l | grep -qw synaptic || sudo apt install -yyq synaptic
#dpkg -l | grep -qw aptitude || sudo apt install -yyq aptitude
dpkg -l | grep -qw tasksel || sudo apt install -yyq tasksel
dpkg -l | grep -qw gdebi || sudo apt install -yyq gdebi
dpkg -l | grep -qw curl || sudo apt install -yyq curl
<<<<<<< HEAD
dpkg -l | grep -qw muon || sudo apt install -yyq muon 
#-software-properties-qt
=======
dpkg -l | grep -qw muon || sudo apt install -yyq muon
>>>>>>> 56e8e3ccb7ec3a414a898a5c11a4031e10ea856d
dpkg -l | grep -qw less || sudo apt install -yyq less
dpkg -l | grep -qw git || sudo apt install -yyq git
#sudo dpkg --add-architecture i386
# Other system and settings apps.
dpkg -l | grep -qw grub-customizer || sudo apt install -yyq grub-customizer
#dpkg -l | grep -qw efibootmgr || sudo apt install -yyq efibootmgr
#dpkg -l | grep -qw terminator || sudo apt install -yyq terminator
#dpkg -l | grep -qw latte-dock || sudo apt install -yyq latte-dock
#dpkg -l | grep -qw cmatrix || sudo apt install -yyq cmatrix
dpkg -l | grep -qw ffmpeg || sudo apt install -yyq ffmpeg
<<<<<<< HEAD
#dpkg -l | grep -qw fslint || sudo apt install -yyq fslint
=======
dpkg -l | grep -qw fslint || sudo apt install -yyq fslint
>>>>>>> 56e8e3ccb7ec3a414a898a5c11a4031e10ea856d
#dpkg -l | grep -qw htop || sudo apt install -yyq htop

# Kernels/drivers/configuration apps
# Liquorix
#sudo add-apt-repository --yes ppa:damentz/liquorix
#sudo apt install -yyq linux-image-liquorix-amd64 linux-headers-liquorix-amd64
# Xanmod
#echo 'deb http://deb.xanmod.org releases main' | sudo tee /etc/apt/sources.list.d/xanmod-kernel.list && wget -qO - https://dl.xanmod.org/gpg.key | sudo apt-key add -
#sudo apt update && sudo apt install linux-xanmod
# Nvidia
sudo ubuntu-drivers autoinstall
# Radeon
# Keyboard -Ducky One2 config app
# Mouse -Roccat NYTH config app
# Laptop apps
#dpkg -l | grep -qw tlp || sudo apt install -yyq tlp
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
# Calibre
sudo -v && wget -nv -O- https://download.calibre-ebook.com/linux-installer.sh | sudo sh /dev/stdin
# Thunderbird
sudo add-apt-repository --yes ppa:timo-jyrinki/thunderbird78
dpkg -l | grep -qw thunderbird || sudo apt install -yyq thunderbird
# LibreOffice
sudo add-apt-repository --yes ppa:libreoffice/libreoffice-7-0
sudo apt install -yyq libreoffice


# Remote Access Tools
# TeamViewer
wget https://download.teamviewer.com/download/linux/teamviewer_amd64.deb
sudo gdebi -n teamviewer_amd64.deb
rm teamviewer_amd64.deb
#dpkg -l | grep -qw htop || sudo apt install -yyq remmina
#ssh dpkg -l | grep -qw htop || sudo apt install -yyq htop

# Cloud storage/sync
# Rclone
curl https://rclone.org/install.sh | sudo bash
#sudo apt install -yyq rclone-browser
# OneDrive - thru rclone
# Google Drive - thru rclone
# MEGA Sync - rclone or mega client
# Google Photos - thru rclone

# Project development
# FreeCAD
#sudo add-apt-repository --yes ppa:freecad-maintainers/freecad-stable
#dpkg -l | grep -qw freecad || sudo apt install -yyq freecad
# KiCAD
sudo add-apt-repository --yes ppa:kicad/kicad-5.1-releases
dpkg -l | grep -qw kicad || sudo apt install -yyq kicad 
# Python
dpkg -l | grep -qw python3 || sudo apt install -yyq python3
dpkg -l | grep -qw python3-pip || sudo apt install -yyq python3-pip
# Arduino
dpkg -l | grep -qw arduino || sudo apt install -yyq arduino
# Powershell
#wget https://packages.microsoft.com/config/debian/10/packages-microsoft-prod.deb
#sudo dpkg -i packages-microsoft-prod.deb
#rm packages-microsoft-prod.deb
#sudo apt update && sudo apt install -yyq powershell
# VSCode
sudo wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt update && sudo apt install -yyq code
# Notepadqq
#echo "deb http://ppa.launchpad.net/notepadqq-team/notepadqq/ubuntu trusty main" | sudo tee /etc/apt/sources.list.d/notepadqq.list
#sudo apt-key adv --recv-key --keyserver keyserver.ubuntu.com 63DE9CD4
#sudo apt update && sudo apt install -yyq notepadqq
# Brackets
#https://github.com/adobe/brackets/releases/download/release-1.14.1/Brackets.Release.1.14.1.64-bit.deb
#sudo add-apt-repository ppa:webupd8team/brackets
#sudo apt update#sudo apt install brackets

# Multimedia
# Spotify
#sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 4773BD5E130D1D45
#echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
#sudo apt update && sudo apt install -yyq spotify-client
dpkg -l | grep -qw vlc || sudo apt install -yyq vlc
#clementine/strawberry dpkg -l | grep -qw htop || sudo apt install -yyq htop

# 'Graphic' design - Audio/Video editing
# Kdenlive
sudo add-apt-repository --yes ppa:kdenlive/kdenlive-stable
sudo apt install -yyq kdenlive
# OBS
sudo add-apt-repository --yes ppa:obsproject/obs-studio
sudo apt install -yyq obs-studio

dpkg -l | grep -qw inkscape || sudo apt install -yyq inkscape
dpkg -l | grep -qw audacity || sudo apt install -yyq audacity
#gimp





# Gaming
# Steam
#sudo apt install -yyq steam-installer
#wget https://steamcdn-a.akamaihd.net/client/installer/steam.deb
# GOG
# Lutris
#sudo add-apt-repository --yes ppa:lutris-team/lutris
#sudo apt install -yyq lutris
# DOS Box

# Secure Comms
# OnionShare
#sudo add-apt-repository ppa:micahflee/ppa
#sudo apt install -yyq onionshare
# Signal
#curl -s https://updates.signal.org/desktop/apt/keys.asc | sudo apt-key add -
#echo "deb [arch=amd64] https://updates.signal.org/desktop/apt xenial main" | sudo tee -a /etc/apt/sources.list.d/signal-xenial.list
#sudo apt update && sudo apt install -yyq signal-desktop


sudo apt full-upgrade -yy
sudo apt autoremove -yy
sudo apt autoclean

echo "-------------------"
echo "- Setup Complete! -"
echo "-------------------"
