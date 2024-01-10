#!/bin/bash
# Application installation script for a fresh install

# Insure everything is up to date before proceeding
sudo dnf -y update --best --allowerasing --skip-broken

# Add repositories
# rpmfusion
sudo dnf -y install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf -y install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
# Flathub
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
# Brave browser
sudo dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/x86_64/
sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc
# Microsoft
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
curl https://packages.microsoft.com/config/rhel/7/prod.repo | sudo tee /etc/yum.repos.d/microsoft.repo
# Enable COPRs
sudo dnf copr enable sentry/xone

dnf check-update

# Cli tools
sudo dnf -y install git wget dnf-plugins-core
# Cli toys
sudo dnf -y install neofetch

# My preferred apps. Browser, email, etc.
sudo dnf -y install brave-browser thunderbird vlc python-vlc

# Cloud services
# NextCloud
# Mega
# OneDrive
# Google Drive

# Knowledge mgmt
# calibre
# obsidian

# Cross-platform mgmt
# barrier/whatever supports wayland
# Teamviewer, until I find better

# Comms
# discord
# signal

# Project tools

# Content creation

