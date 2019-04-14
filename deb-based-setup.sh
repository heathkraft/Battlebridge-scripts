!/bin/bash

# Script to install 3rd party software that I use regularly.
sudo apt clean
sudo apt update

# Check if some apps are already installed before installing them.
dpkg -l | grep -qw gdebi || sudo apt-get install -yyq gdebi
dpkg -l | grep -qw synaptic || sudo apt-get install -yyq synaptic
dpkg -l | grep -qw htop || sudo apt-get install -yyq htop
dpkg -l | grep -qw terminator || sudo apt-get install -yyq terminator
dpkg -l | grep -qw dolphin || sudo apt-get install -yyq dolphin
dpkg -l | grep -qw fslint || sudo apt-get install -yyq fslint
dpkg -l | grep -qw kdeconnect || sudo apt-get install -yyq kdeconnect

# Install Chrome Browser.
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo gdebi -n google-chrome-stable_current_amd64.deb
rm google-chrome-stable_current_amd64.deb

# Install Gnome shell support for browser for gsconnect (KDE-connect).
# sudo apt install chrome-gnome-shell -y

# Remove Fluendo mp3 codec if installed.
sudo apt-get purge -yyqq gstreamer1.0-fluendo-mp3

# Install TeamViewer.
wget https://download.teamviewer.com/download/linux/teamviewer_amd64.deb
sudo apt install ./teamviewer_amd64.deb
rm teamviewer_amd64.deb

# Install NVidia drivers, and add repo to keep them updated.
sudo add-apt-repository ppa:graphics-drivers/ppa
sudo ubuntu-drivers autoinstall || sudo apt upgrade -y && sudo ubuntu-drivers autoinstall

# Install OpenRazer drivers and interface.
sudo add-apt-repository ppa:openrazer/stable
sudo add-apt-repository ppa:polychromatic/stable
sudo apt update
sudo apt install openrazer-meta -y && sudo apt install polychromatic -y

# Install Steam client.
sudo add-apt-repository multiverse
sudo apt update
sudo apt install steam

# Install Ubuntu Kernel update utility.
sudo add-apt-repository -y ppa:teejee2008/ppa
sudo apt update
sudo apt install ukuu

# Install Megasync client.
wget https://mega.nz/linux/MEGAsync/xUbuntu_18.04/amd64/megasync-xUbuntu_18.04_amd64.deb
sudo gdebi -n megasync-xUbuntu_18.04_amd64.deb
rm megasync-xUbuntu_18.04_amd64.deb



sudo add-apt-repository -y ppa:mozillateam/ppa
sudo add-apt-repository -y ppa:libreoffice/ppa





echo "--------------------
-       Done!      -
--------------------
"
