#!/bin/bash
#Battle-bridge app install/setup script -- Fedora edition

#Initial system update to prep for setup
sudo dnf -y update

#App mgmt, repos, storefronts
#rpmfusion repos
sudo dnf -y install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf -y install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
#Flathub
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
#Brave browser
sudo dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/x86_64/
sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc
#Microsoft- VSCode Powershell
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
curl https://packages.microsoft.com/config/rhel/7/prod.repo | sudo tee /etc/yum.repos.d/microsoft.repo
#Bismuth
sudo dnf copr enable capucho/bismuth 
Appimage pool


dnf check-update

#Terminal -- Yakuake - tools -- git, wget, neofetch, dnf-plugins-core
sudo dnf -y install git wget dnf-plugins-core neofetch

#customization tools
sudo dnf -y install bismuth grub-customizer latte-dock yakuake


#The usual suspects [browser, email client, media player]
#Brave browser
sudo dnf -y install brave-browser
#Thunderbird email client
sudo dnf -y install thunderbird
#VLC and Clementine media players
sudo dnf -y install vlc python-vlc


flatpak install flathub com.github.debauchee.barrier
calibre
Obsidian:
flatpak install flathub md.obsidian.Obsidian
? clementine -- flatpak


#Teamviewer
wget https://download.teamviewer.com/download/linux/teamviewer.x86_64.rpm
sudo dnf -y install ./teamviewer.x86_64.rpm
rm teamviewer.x86_64.rpm


discord -- flatpak
bitwarden -- flatpak


Mega: 
Download the package and, in a terminal, install it with:
sudo dnf install /path/to/downloaded/package.rpm

appimage launcher

#Project tools -- VSCode, Notepadqq, FreeCAD, Kicad, Arduino, SuperSlicer, xournal++, obsidian, Powershell
sudo dnf -y install code xournalpp
#powershell
sudo dnf install compat-openssl10
sudo dnf install -y powershell
#or
#sudo dnf install https://github.com/PowerShell/PowerShell/releases/download/v7.2.1/powershell-lts-7.2.1-1.rh.x86_64.rpm

notepadqq -- flatpak
For more streamlined downloading of AppImages download AppImageUpdate (GUI or the command line version). To perform an update:

Using GUI
chmod +x ./AppImageUpdate.AppImage
./AppImageUpdate.AppImage ./FreeCAD.AppImage
Command line
chmod +x ./appimageupdatetool.AppImage
./appimageupdatetool.AppImage ./FreeCAD.AppImage

#content tools -- OBS, Kdenlive, GIMP, Inkscape, Audacity
sudo dnf -y install obs-studio gimp inkscape audacity

kdenlive -- flatpak

#gaming -- Steam, Lutris, MiniGalaxy
sudo dnf -y install steam lutris minigalaxy

echo "-------------"
echo "- Complete! -"
echo "-------------"