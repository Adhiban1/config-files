#!/bin/sh
echo "[update]..."
sudo apt update
sudo apt upgrade -y

echo "[add-apt-repository]..."
# add-apt-repository ppa:flatpak/stable
sudo add-apt-repository universe
sudo apt update
sudo apt upgrade -y

echo "[apt install]..."
sudo apt install vlc -y
sudo apt install code -y
sudo apt install libreoffice -y
sudo apt install bleachbit -y
sudo apt install neovim -y
sudo apt-get install simplescreenrecorder -y
sudo apt install ubuntu-restricted-extras -y
sudo apt-get install tlp tlp-rdw -y
sudo systemct1 enable tlp
sudo apt install gnome-tweak-tool -y
sudo apt install git -y
# sudo apt install r-base r-base-dev -y
# sudo apt install flatpak -y
# sudo apt install gnome-software-plugin-flatpak -y
# flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
sudo apt install google-chrome-stable -y
sudo apt install packettracer -y

echo "[sudo apt clean & remove]..."
sudo apt autoclean
sudo apt autoremove

echo "[Enable 'Minimize on Click' for the Ubuntu Dock]"
gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize'

echo "[python]..."
sudo apt install python3-pip python3-venv -y
pip install -r requirments.txt

# echo "[reboot]"
# reboot