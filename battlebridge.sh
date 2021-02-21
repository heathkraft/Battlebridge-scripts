
# This will setup my primary computer after I complete my new build.
# After that, it will mostly serve as a collection of commands for installing apps that I will use piece-meal for other scripts.

sudo rm /etc/apt/sources.list.d/preinsta*
# Clean apt-cache, refresh, and upgrade all currently installed apps in preparation for the rest of the setup script.
sudo apt clean
#sudo apt update
#sudo apt full-upgrade -yy
sudo pkcon refresh && sudo pkcon update -y

mkdir ~/bin/

# Basic Linux mgmt apps
sudo dpkg --add-architecture i386
dpkg -l | grep -qw apt-transport-https || sudo apt install -yyq apt-transport-https
dpkg -l | grep -qw grub-customizer || sudo apt install -yyq grub-customizer
dpkg -l | grep -qw synaptic || sudo apt install -yyq synaptic
dpkg -l | grep -qw aptitude || sudo apt install -yyq aptitude
dpkg -l | grep -qw neofetch || sudo apt install -yyq neofetch
dpkg -l | grep -qw tasksel || sudo apt install -yyq tasksel
dpkg -l | grep -qw muon || sudo apt install -yyq muon
dpkg -l | grep -qw curl || sudo apt install -yyq curl
dpkg -l | grep -qw less || sudo apt install -yyq less

# Kernels, Drivers, config/personalization
#-Custom kernels
#---Liquorix
#sudo add-apt-repository --yes ppa:damentz/liquorix
#sudo apt install -yyq linux-image-liquorix-amd64 linux-headers-liquorix-amd64
#---Xanmod
#echo 'deb http://deb.xanmod.org releases main' | sudo tee /etc/apt/sources.list.d/xanmod-kernel.list && wget -qO - https://dl.xanmod.org/gpg.key | sudo apt-key add -
#sudo apt update && sudo apt install linux-xanmod
#-Drivers and config apps
sudo ubuntu-drivers autoinstall
#sudo apt install kubuntu-driver-manager  --- installs but does not work
#---Roccat
#https://sourceforge.net/projects/roccat/files/
#---Ducky
#Brother Printer drivers
#-Umm... other apps...
sudo apt install -yyq kubuntu-restricted-extras
sudo apt install -yyq ubuntu-restricted-extras
sudo apt install -yyq latte-dock
sudo apt install -yyq yakuake
# https://github.com/TheAssassin/AppImageLauncher/releases
https://github.com/twpayne/chezmoi -- curl -sfL https://git.io/chezmoi | sh
#https://github.com/twpayne/chezmoi/releases/download/v1.8.9/chezmoi_1.8.9_linux_amd64.deb

# General PC usage apps
#-Browsers
#---Brave
curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -
echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update && sudo apt install -yyq brave-browser
#---Chromium
#?sudo apt install -yyq chromium-browser
#---Chrome
#wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
#sudo dpkg -n google-chrome-stable_current_amd64.deb
#rm google-chrome-stable_current_amd64.deb
#---Edge
#curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
#sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
#sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/edge stable main" > /etc/apt/sources.list.d/microsoft-edge-dev.list'
#sudo rm microsoft.gpg
#sudo apt update
#sudo apt install microsoft-edge-dev

#-Office apps
#---Thunderbird
sudo add-apt-repository --yes ppa:timo-jyrinki/thunderbird78
dpkg -l | grep -qw thunderbird || sudo apt install -yyq thunderbird
#---LibreOffice
sudo add-apt-repository --yes ppa:libreoffice/libreoffice-7-0
sudo apt install -yyq libreoffice
#---Calibre
sudo -v && wget -nv -O- https://download.calibre-ebook.com/linux-installer.sh | sudo sh /dev/stdin
#-Multimedia
sudo apt install -yyq pulseeffects
bash -c "$(curl -fsSL https://raw.githubusercontent.com/JackHack96/PulseEffects-Presets/master/install.sh)"
#---VLC
dpkg -l | grep -qw vlc || sudo apt install -yyq vlc
#---Clementine
sudo apt install -yyq clementine
#---Spotify
#sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 4773BD5E130D1D45
#echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
#sudo apt update && sudo apt install -yyq spotify-client
#---Pandora
sudo apt install -yyq pithos

# Personal eco-system
#-Remote 'control'
#---TeamViewer
wget https://download.teamviewer.com/download/linux/teamviewer_amd64.deb
sudo dpkg -i --force-depends teamviewer_amd64.deb
sudo apt --fix-broken install
rm teamviewer_amd64.deb
#---Barrier
sudo apt install -yyq barrier
#---Remmina
#---SSH
#-Cloud storage/sync
#---Rclone and browser
sudo apt install -yyq rclone-browser
curl https://rclone.org/install.sh | sudo bash
#   -Onedrive
#   -Googledrive
#   -Mega
#   -Googlephotos

# Project tools
#--Insure Python3 and pip is installed
dpkg -l | grep -qw python3 || sudo apt install -yyq python3
dpkg -l | grep -qw python3-pip || sudo apt install -yyq python3-pip
#---Git
dpkg -l | grep -qw git || sudo apt install -yyq git
#---VSCode
sudo wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" | sudo tee /etc/apt/sources.list.d/vscode.list
sudo apt update && sudo apt install -yyq code
#---Notepadqq
sudo apt install -yyq notepadqq
#---Powershell
#wget https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb
#sudo apt install packages-microsoft-prod.deb
#rm packages-microsoft-prod.deb
#sudo apt update && sudo apt install -yyq powershell
#---Brackets
#---FreeCAD
#--Download appimage from github: realthunder version
#sudo snap install freecad
#sudo add-apt-repository --yes ppa:freecad-maintainers/freecad-stable
#dpkg -l | grep -qw freecad || sudo apt install -yyq freecad
#---KiCAD
sudo add-apt-repository --yes ppa:kicad/kicad-5.1-releases
dpkg -l | grep -qw kicad || sudo apt install -yyq kicad
#---Arduino
dpkg -l | grep -qw arduino || sudo apt install -yyq arduino

# Content creation
#---GIMP
sudo apt install -yyq gimp
#---Inkscape
sudo add-apt-repository --yes ppa:inkscape.dev/stable
dpkg -l | grep -qw inkscape || sudo apt install -yyq inkscape
#---Audacity
dpkg -l | grep -qw audacity && sudo apt remove -yyq audacity
sudo add-apt-repository --yes ppa:ubuntuhandbook1/audacity
dpkg -l | grep -qw audacity || sudo apt install -yyq audacity
#---Blender
#---Kdenlive
sudo add-apt-repository --yes ppa:kdenlive/kdenlive-stable
sudo apt install -yyq kdenlive
#---OBS
sudo add-apt-repository --yes ppa:obsproject/obs-studio
sudo apt install -yyq obs-studio
#---YouTube-dl
sudo curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
sudo chmod a+rx /usr/local/bin/youtube-dl

# Gaming
#---Steam
wget https://steamcdn-a.akamaihd.net/client/installer/steam.deb
sudo dpkg -i steam.deb
sudo apt --fix-broken install
rm steam.deb
#---Lutris
sudo add-apt-repository --yes ppa:lutris-team/lutris
sudo apt install -yyq lutris
#---GOG - integrated with lutris
#---XBox controller
sudo apt install -yyq xboxdrv
echo 'options bluetooth disable_ertm=Y' | sudo tee -a /etc/modprobe.d/bluetooth.conf

# Comms
#---MS Teams - download deb pkg
#---Zoom - download deb pkg
#---Discord - download deb pkg

# Privacy/Security
#---TOR - download pkg
#---OnionShare
#sudo add-apt-repository --yes ppa:micahflee/ppa
#sudo apt install -yyq onionshare
#---Signal
#curl -s https://updates.signal.org/desktop/apt/keys.asc | sudo apt-key add -
#echo "deb [arch=amd64] https://updates.signal.org/desktop/apt xenial main" | sudo tee -a /etc/apt/sources.list.d/signal-xenial.list
#sudo apt update && sudo apt install -yyq signal-desktop
#---Protonmail - if any kind of installable app
#  -vpn--wireguard

#sudo apt install digikam kcolorchooser ktorrent speedcrunch kfind redshift plasma-applet-redshift-control cherrytree
#firewall - apt install gufw
# Remove Fluendo mp3 codec if installed.
#sudo apt purge -yyqq gstreamer1.0-fluendo-mp3

#sudo sed -i 's/focal/groovy/g' /etc/apt/sources.list
sudo apt clean
sudo pkcon refresh
sudo pkcon update -y
#sudo apt update
#sudo apt full-upgrade -yy
sudo apt autoremove -yy
sudo apt autoclean

echo "-------------------"
echo "- Setup Complete! -"
echo "-------------------"

# --Laptop - move this to a laptop script
#    tlp
#    auto-cpu-freq

#chezmoi init --apply --verbose https://github.com/username/dotfiles.git
