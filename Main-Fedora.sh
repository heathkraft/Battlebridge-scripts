#!/bin/bash
# Setup script for a fresh battlebridge installation

# improve DNF settings
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
dnf -y install git wget dnf-plugins-core dnfdragora
# Cli toys
dnf -y install cmatrix fastfetch

# Appimage mgmt
mkdir /home/h/Appimages
flatpak install flathub io.github.prateekmedia.appimagepool
flatpak install flathub it.mijorus.gearlever

# The usual apps
dnf -y install brave-browser thunderbird vlc python-vlc

# Cloud services
# NextCloud
# Mega
flatpak install flathub nz.mega.MEGAsync
# OneDrive
# Google Drive

# Knowledge mgmt
# calibre- ebook library mgmt
flatpak install flathub com.calibre_ebook.calibre
# obsidian- notes and 'personal knwledge mgmt'
flatpak install flathub md.obsidian.Obsidian
# xournalapp- handwritten notes
flatpak install flathub com.github.xournalpp.xournalpp

# Cross-platform mgmt
# Input-leap
# Teamviewer, until I can implement a better solution
wget https://download.teamviewer.com/download/linux/teamviewer.x86_64.rpm
dnf -y install ./teamviewer.x86_64.rpm
rm teamviewer.x86_64.rpm

# Comms
# discord
flatpak install flathub com.discordapp.Discord
# signal

# Project tools
dnf -y install code
flatpak install flathub com.notepadqq.Notepadqq
dnf -y install compat-openssl10 powershell
flatpak install flathub org.freecadweb.FreeCAD

# Content creation
dnf -y install obs-studio
#flatpak install flathub com.github.wwmm.easyeffects

# Gaming
dnf -y install steam
flatpak install flathub com.heroicgameslauncher.hgl
flatpak install flathub net.lutris.Lutris
# xbox controller driver
dnf -y install xone lpf-xone-firmware
lpf approve xone-firmware
lpf build xone-firmware
lpf install xone-firmware
# reboot required to load modules

echo "-------------"
echo "- Complete! -"
echo "-------------"