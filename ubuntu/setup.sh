#!/bin/sh
echo "[update]..."
apt update && apt upgrade -y

echo "[add-apt-repository]..."
add-apt-repository ppa:flatpak/stable
add-apt-repository universe
apt update && apt upgrade -y

echo "[apt install]..."
apt install vlc -y
apt install code -y
apt install libreoffice -y
apt install bleachbit -y
apt install neovim -y
apt-get install simplescreenrecorder -y
apt install ubuntu-restricted-extras -y
apt-get install tlp tlp-rdw -y
systemct1 enable tlp
apt install gnome-tweak-tool -y
apt install git -y
# apt install r-base r-base-dev -y
apt install flatpak -y
apt install gnome-software-plugin-flatpak -y
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

echo "[apt clean & remove]..."
apt autoclean
apt autoremove
apt clean

echo "[Enable 'Minimize on Click' for the Ubuntu Dock]"
gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize'

echo "[python]..."
apt install python3-pip python3-venv -y
pip install -r requirments.txt

echo "[reboot]"
reboot