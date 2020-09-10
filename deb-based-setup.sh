!/bin/bash

# Script to install 3rd party software that I use regularly.
sudo apt clean
sudo apt update

# Remove Fluendo mp3 codec if installed.
sudo apt purge -yyqq gstreamer1.0-fluendo-mp3

# Check if some apps are already installed before installing them.
# BASH apps
dpkg -l | grep -qw aptitude || sudo apt install -yyq aptitude
dpkg -l | grep -qw tasksel || sudo apt install -yyq tasksel
dpkg -l | grep -qw gdebi || sudo apt install -yyq gdebi
dpkg -l | grep -qw htop || sudo apt install -yyq htop
dpkg -l | grep -qw apt-transport-https || sudo apt install -yyq apt-transport-https
dpkg -l | grep -qw curl || sudo apt install -yyq curl
dpkg -l | grep -qw software-properties-common || sudo apt install -yyq software-properties-common
dpkg -l | grep -qw cmatrix || sudo apt install -yyq cmatrix
dpkg -l | grep -qw git || sudo apt install -yyq git
# Package management
dpkg -l | grep -qw muon || sudo apt install -yyq muon
dpkg -l | grep -qw synaptic || sudo apt install -yyq synaptic
# System tools
dpkg -l | grep -qw fslint || sudo apt install -yyq fslint
dpkg -l | grep -qw efibootmgr || sudo apt install -yyq efibootmgr
# Other apps
dpkg -l | grep -qw terminator || sudo apt install -yyq terminator
dpkg -l | grep -qw grub-customizer || sudo apt install -yyq grub-customizer
dpkg -l | grep -qw calibre || sudo apt install -yyq calibre
dpkg -l | grep -qw thunderbird || sudo apt install -yyq thunderbird
dpkg -l | grep -qw freecad || sudo apt install -yyq freecad
dpkg -l | grep -qw inkscape || sudo apt install -yyq inkscape

# Kernels/drivers
# Liquorix
curl 'https://liquorix.net/add-liquorix-repo.sh' | sudo bash
sudo apt install linux-image-liquorix-amd64 linux-headers-liquorix-amd64
# Nvidia
sudo apt install -yyq nvidia-driver
# Radeon
# Keyboard -Ducky One2
# Mouse -Roccat NYTH

# Browsers
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
wget https://packages.microsoft.com/config/debian/10/packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
rm packages-microsoft-prod.deb
sudo apt update
sudo apt install -yyq powershell
# VSCode
sudo wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt update
sudo apt install -yyq code
# Notepadqq
#sudo add-apt-repository ppa:notepadqq-team/notepadqq
# above will only work after finding the correct signing key - installs latest ubuntu version 2.0beta
# below works as is -installs ubuntu trusty version 1.4stable
echo "deb http://ppa.launchpad.net/notepadqq-team/notepadqq/ubuntu trusty main" | sudo tee /etc/apt/sources.list.d/notepadqq.list
sudo apt-key adv --recv-key --keyserver keyserver.ubuntu.com 63DE9CD4
sudo apt update
sudo apt install -yyq notepadqq
# Brackets
#https://github.com/adobe/brackets/releases/download/release-1.14.1/Brackets.Release.1.14.1.64-bit.deb
#sudo add-apt-repository ppa:webupd8team/brackets
#sudo apt update
#sudo apt install brackets

# Gaming
# Steam
#sudo dpkg --add-architecture i386
#sudo apt update
#enable non-free repo
#sudo apt install steam
# GOG
# Lutris
wget https://download.opensuse.org/repositories/home:/strycore/Debian_9.0/Release.key
sudo apt-key add Release.key
echo "deb http://download.opensuse.org/repositories/home:/strycore/Debian_9.0/ ./" | sudo tee /etc/apt/sources.list.d/lutris.list
sudo apt install -yyq lutris
# DOS Box

# Cloud storage
# OneDrive
# Google Drive
# MEGA Sync
# Google Photos

#sudo add-apt-repository ppa:webupd8team/y-ppa-manager
#sudo apt update
#sudo apt install y-ppa-manager
#echo "deb http://ppa.launchpad.net/webupd8team/y-ppa-manager/ubuntu focal main" | sudo tee /etc/apt/sources.list.d/y-ppa-manager.list
#deb-src http://ppa.launchpad.net/webupd8team/y-ppa-manager/ubuntu focal main 
#sudo apt-key adv --recv-key --keyserver keyserver.ubuntu.com C2518248EEA14886

#sudo add-apt-repository -y ppa:mozillateam/ppa
#sudo apt-key adv --recv-key --keyserver keyserver.ubuntu.com 1015216E75198A89

#sudo add-apt-repository -y ppa:libreoffice/ppa
#sudo apt-key adv --recv-key --keyserver keyserver.ubuntu.com 83FBA1751378B444
#echo "deb http://ppa.launchpad.net/libreoffice/libreoffice-7-0/ubuntu focal main" | sudo tee /etc/apt/sources.list.d/libreoffice7.list
#deb-src http://ppa.launchpad.net/libreoffice/libreoffice-7-0/ubuntu focal main 




echo "--------------------
-       Done!      -
--------------------
"
