#!/bin/sh
echo "[update]..."
apt update && apt upgrade -y

echo "[apt-repository]..."
add-apt-repository ppa:flatpak/stable
add-apt-repository universe
apt update && apt upgrade -y

echo "[apt install]..."
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

echo "[docker]..."
for pkg in docker.io docker-doc docker-compose podman-docker containerd runc; do apt-get remove $pkg; done
apt-get update
apt-get install ca-certificates curl gnupg
install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
chmod a+r /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  tee /etc/apt/sources.list.d/docker.list > /dev/null
apt-get update
apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
groupadd docker
usermod -aG docker $USER

ufw enable

echo "[reboot]"
reboot