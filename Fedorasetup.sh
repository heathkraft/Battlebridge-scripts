#!/bin/bash
#Fedora system install script

#Initial system update to prep for setup
sudo dnf -y update

#rpmfusion repos
sudo dnf -y install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf -y install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
#Flathub
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
#Brave browser
sudo dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/x86_64/
sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc
#VSCode
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
#Bismuth
sudo dnf copr enable capucho/bismuth 


dnf check-update

#Terminal -- Yakuake, cli tools -- wget, neofetch, dnf-plugins-core
sudo dnf -y install wget dnf-plugins-core neofetch

#customization tools
grub-customizer
latte-dock
yakuake
$ sudo dnf install bismuth

#General usage apps [browser, email, terminal]
#Brave browser:
sudo dnf install brave-browser

thunderbird
flatpak install flathub com.github.debauchee.barrier
calibre
Obsidian:
flatpak install flathub md.obsidian.Obsidian
? clementine -- flatpak

VLC:
 $> su -
    #> dnf install vlc
    #> dnf install python-vlc (optional)

Teamviewer:
wget https://download.teamviewer.com/download/linux/teamviewer.x86_64.rpm
sudo dnf -y install ./teamviewer.x86_64.rpm


discord -- flatpak
bitwarden -- flatpak


Mega: 
Download the package and, in a terminal, install it with:
sudo dnf install /path/to/downloaded/package.rpm

Appimage pool
appimage launcher

#Project tools -- VSCode, Notepadqq, FreeCAD, Kicad, Arduino, SuperSlicer
vscode:
dnf check-update
sudo dnf install code

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

#gaming -- Steam, Lutris
sudo dnf -y install steam lutris

vscodium:
sudo rpmkeys --import https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/raw/master/pub.gpg
printf "[gitlab.com_paulcarroty_vscodium_repo]\nname=download.vscodium.com\nbaseurl=https://download.vscodium.com/rpms/\nenabled=1\ngpgcheck=1\nrepo_gpgcheck=1\ngpgkey=https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/raw/master/pub.gpg" |sudo tee -a /etc/yum.repos.d/vscodium.repo
sudo dnf install codium


echo "-------------"
echo "- Complete! -"
echo "-------------"