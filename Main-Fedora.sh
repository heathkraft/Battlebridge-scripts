#!/bin/bash
# Setup script for a fresh battlebridge installation

#improve DNF settings
echo 'fastestmirror=True' >> /etc/dnf/dnf.conf
echo 'defaultyes=True' >> /etc/dnf/dnf.conf
echo 'max_parallel_downloads=10' >> /etc/dnf/dnf.conf
echo 'keepcache=True' >> /etc/dnf/dnf.conf

# Insure everything is up to date before proceeding
dnf -y update --best --allowerasing --skip-broken

# Add repositories
# rpmfusion
dnf -y install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
dnf -y install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
# Flathub
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
# Brave browser
dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/x86_64/
rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc
# Microsoft
rpm --import https://packages.microsoft.com/keys/microsoft.asc
sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
curl https://packages.microsoft.com/config/rhel/7/prod.repo | tee /etc/yum.repos.d/microsoft.repo
# Enable COPRs
dnf copr enable sentry/xone

dnf check-update

# Cli tools
dnf -y install git wget dnf-plugins-core
# Cli toys
dnf -y install cmatrix

# Appimage mgmt
mkdir /home/h/Appimages
wget https://github.com/TheAssassin/AppImageLauncher/releases/download/v2.2.0/appimagelauncher-2.2.0-travis995.0f91801.x86_64.rpm
dnf -y install ./appimagelauncher-2.2.0-travis995.0f91801.x86_64.rpm
rm appimagelauncher-2.2.0-travis995.0f91801.x86_64.rpm
wget https://github.com/AppImageCommunity/AppImageUpdate/releases/download/2.0.0-alpha-1-20230526/AppImageUpdate-x86_64.AppImage -P /home/h/Appimages

# The usual apps
dnf -y install brave-browser thunderbird vlc python-vlc

# Cloud services
# NextCloud
# Mega
# OneDrive
# Google Drive

# Knowledge mgmt
# calibre
flatpak install flathub com.calibre_ebook.calibre
# obsidian
flatpak install flathub md.obsidian.Obsidian

# Cross-platform mgmt
# barrier/whatever supports wayland
# Teamviewer, until I find better
wget https://download.teamviewer.com/download/linux/teamviewer.x86_64.rpm
dnf -y install ./teamviewer.x86_64.rpm
rm teamviewer.x86_64.rpm

# Comms
# discord
flatpak install flathub com.discordapp.Discord
# signal

# Project tools

# Content creation
flatpak install flathub com.obsproject.Studio

# Gaming
flatpak install flathub com.heroicgameslauncher.hgl
flatpak install flathub net.lutris.Lutris

echo "-------------"
echo "- Complete! -"
echo "-------------"