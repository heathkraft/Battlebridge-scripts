!/bin/bash

# Script to install 3rd party software that I use regularly.
sudo apt clean
sudo apt update

# Check if some apps are already installed before installing them.
dpkg -l | grep -qw aptitude || sudo apt install -yyq aptitude
dpkg -l | grep -qw tasksel || sudo apt install -yyq tasksel
dpkg -l | grep -qw cmatrix || sudo apt install -yyq cmatrix
dpkg -l | grep -qw gdebi || sudo apt install -yyq gdebi
dpkg -l | grep -qw synaptic || sudo apt install -yyq synaptic
dpkg -l | grep -qw htop || sudo apt install -yyq htop
dpkg -l | grep -qw terminator || sudo apt install -yyq terminator
dpkg -l | grep -qw dolphin || sudo apt install -yyq dolphin
dpkg -l | grep -qw fslint || sudo apt install -yyq fslint
dpkg -l | grep -qw kdeconnect || sudo apt install -yyq kdeconnect
dpkg -l | grep -qw git || sudo apt install -yyq git
dpkg -l | grep -qw efibootmgr || sudo apt install -yyq efibootmgr
dpkg -l | grep -qw calibre || sudo apt install -yyq calibre
dpkg -l | grep -qw thunderbird || sudo apt install -yyq thunderbird
dpkg -l | grep -qw muon || sudo apt install -yyq muon

# Install Chrome Browser.
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo gdebi -n google-chrome-stable_current_amd64.deb
rm google-chrome-stable_current_amd64.deb

# Install TeamViewer.
wget https://download.teamviewer.com/download/linux/teamviewer_amd64.deb
sudo apt install ./teamviewer_amd64.deb
rm teamviewer_amd64.deb

# Install OpenRazer drivers and interface.
#sudo echo 'deb http://download.opensuse.org/repositories/hardware:/razer/Debian_9.0/ /' > /etc/apt/sources.list.d/hardware:razer.list#sudo add-apt-repository ppa:openrazer/stable
#echo "deb http://ppa.launchpad.net/polychromatic/stable/ubuntu xenial main" | sudo tee -a /etc/apt/sources.list.d/polychromatic.list
#sudo apt-key adv --recv-key --keyserver keyserver.ubuntu.com 96B9CD7C22E2C8C5
#sudo aptitude update
#sudo apt install polychromatic -y

# Install NVidia drivers, and add repo to keep them updated.
#sudo add-apt-repository ppa:graphics-drivers/ppa
#sudo ubuntu-drivers autoinstall || sudo apt upgrade -y && sudo ubuntu-drivers autoinstall

# Install Steam client.
#sudo add-apt-repository multiverse
#sudo apt update
#sudo apt install steam

# Install Ubuntu Kernel update utility.
#sudo add-apt-repository -y ppa:teejee2008/ppa
#sudo apt update
#sudo apt install ukuu

# Install Megasync client.
#wget https://mega.nz/linux/MEGAsync/xUbuntu_18.04/amd64/megasync-xUbuntu_18.04_amd64.deb
#sudo gdebi -n megasync-xUbuntu_18.04_amd64.deb
#rm megasync-xUbuntu_18.04_amd64.deb

# Remove Fluendo mp3 codec if installed.
sudo apt purge -yyqq gstreamer1.0-fluendo-mp3



#sudo add-apt-repository -y ppa:mozillateam/ppa
#sudo add-apt-repository -y ppa:libreoffice/ppa





echo "--------------------
-       Done!      -
--------------------
"
