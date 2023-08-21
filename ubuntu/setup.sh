#!/bin/sh
echo "[update]..."
apt update && apt upgrade -y

echo "[apt-repository]..."
add-apt-repository ppa:flatpak/stable
add-apt-repository universe
apt update && apt upgrade -y

echo "[apt install]..."
sudo apt-get install simplescreenrecorder -y
apt install ubuntu-restricted-extras -y
apt-get install tlp tlp-rdw -y
systemct1 enable tlp
apt install gnome-tweak-tool -y
apt install git -y
# sudo apt install r-base r-base-dev -y
apt install flatpak -y
apt install gnome-software-plugin-flatpak -y
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

echo "[apt clean & remove]..."
apt autoclean
apt autoremove
apt clean

echo "[Enable 'Minimize on Click' for the Ubuntu Dock]"
gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize'

echo "[cp]..."
cp python_base.sh /bin/base
cp notebook.sh /bin/notebook
cp lab.sh /bin/lab

echo "[chmod]..."
chmod +x /bin/base
chmod +x /bin/notebook
chmod +x /bin/lab

echo "[python]..."
python3 -m venv base
source base/bin/activate
pip install -r requirments.txt
mv base ~/Documents/base

ufw enable

echo "[reboot]"
reboot