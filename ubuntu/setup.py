import os
from tqdm import tqdm

def run(cmds):
    cmds = cmds.split()
    for cmd in tqdm(cmds):
        os.system(cmd)

print('[Updating]...')
run('sudo apt -qq update')

print('[Upgrading]...')
run('sudo apt -qq update -y')

print('[add-apt-repository]...')
run('''sudo add-apt-repository -qq universe
sudo apt -qq update
sudo apt -qq upgrade -y''')

print('[Installing apps]...')
run('''sudo apt -qq install vlc -y
sudo apt -qq install code -y
sudo apt -qq install libreoffice -y
sudo apt -qq install bleachbit -y
sudo apt -qq install neovim -y
sudo apt-get -qq install simplescreenrecorder -y
sudo apt -qq install ubuntu-restricted-extras -y
sudo apt-get -qq install tlp tlp-rdw -y
sudo systemct1 enable tlp
sudo apt -qq install gnome-tweak-tool -y
sudo apt -qq install git -y
sudo apt -qq install google-chrome-stable -y
sudo apt -qq install packettracer -y''')

print('[sudo apt clean & remove]...')
run('''sudo apt -qq autoclean
sudo apt -qq autoremove''')

print("[Enable 'Minimize on Click' for the Ubuntu Dock]")
run("gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize'")

print('[python]...')
run('''sudo apt -qq install python3-pip python3-venv -y
pip install -q -r requirments.txt''')