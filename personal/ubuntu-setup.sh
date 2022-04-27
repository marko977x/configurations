sudo apt update
yn="n"
# get google chrome
# read -p "Do you wish to install chrome? (y/n)" yn
if [[ $yn == "y" ]] || [[ $yn == "" ]]; then
  sudo wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
  sudo dpkg -i google-chrome-stable_current_amd64.deb
  sudo rm -r google-chrome-stable_current_amd64.deb

  # removing firefox
  sudo apt purge firefox
  sudo rm -R ${HOME}/.mozilla/firefox
  sudo rm -R ${HOME}/.macromedia/
  sudo rm -R ${HOME}/.adobe
  sudo rm -R /etc/firefox/
  sudo rm -R /usr/lib/firefox/
  sudo rm -R /usr/lib/firefox-addons/
  sudo snap remove firefox
fi

# get vscode
# read -p "Do you wish to install vscode? (y/n)" yn
if [[ $yn == "y" ]] || [[ $yn == "" ]]; then
	sudo wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
	sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
	sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
	sudo rm -f packages.microsoft.gpg
	sudo apt install apt-transport-https
	sudo apt update
	sudo apt install code
  sudo apt purge gedit
fi

# get docker
# read -p "Do you wish to install docker? (y/n)" yn
if [[ $yn == "y" ]] || [[ $yn == "" ]]; then
  sudo apt install ca-certificates curl gnupg lsb-release
  sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
  sudo echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
  sudo apt update
  sudo apt install docker-ce docker-ce-cli containerd.io
fi

# get anydesk
# read -p "Do you wish to install anydesk? (y/n)" yn
if [[ $yn == "y" ]] || [[ $yn == "" ]]; then
  sudo wget -qO - https://keys.anydesk.com/repos/DEB-GPG-KEY | sudo apt-key add -
  sudo echo "deb http://deb.anydesk.com/ all main" | sudo tee /etc/apt/sources.list.d/anydesk-stable.list
  sudo apt update
  sudo apt install anydesk
fi

# get skype
# read -p "Do you wish to install skype? (y/n)" yn
if [[ $yn == "y" ]] || [[ $yn == "" ]]; then
  sudo wget https://go.skype.com/skypeforlinux-64.deb
  sudo apt install ./skypeforlinux-64.deb
  sudo rm -r skypeforlinux-64.deb
fi

# get thunderbird
# read -p "Do you wish to install thunderbird? (y/n)" yn
if [[ $yn == "y" ]] || [[ $yn == "" ]]; then
  sudo apt install thunderbird
fi

# get qbittorrent
# read -p "Do you wish to install qbittorrent? (y/n)" yn
if [[ $yn == "y" ]] || [[ $yn == "" ]]; then
  sudo apt install qbittorrent
fi

# get vlc
# read -p "Do you wish to install vlc? (y/n)" yn
if [[ $yn == "y" ]] || [[ $yn == "" ]]; then
  sudo apt install vlc
fi

# set solid black background
sudo touch /home/${USER}/Pictures/background.jpg
sudo curl https://www.solidbackgrounds.com/images/3840x2160/3840x2160-black-solid-color-background.jpg > /home/${USER}/Pictures/background.jpg
sudo chmod 777 /home/${USER}/Pictures/background.jpg
gsettings set org.gnome.desktop.background picture-uri 'file:///home/marko977x/Pictures/background.jpg'

# # setup terminal
# dconf load /org/gnome/terminal/legacy/profiles:/ < $(pwd)/gnome-terminal-profiles.dconf

# # fonts
sudo apt install fonts-firacode

# basic setup
sudo apt install gnome-tweaks
sudo apt install gnome-shell-extensions
gsettings set org.gnome.shell favorite-apps "['org.gnome.Nautilus.desktop', 'org.gnome.Terminal.desktop', 'google-chrome.desktop', 'code.desktop']"
gsettings set org.gnome.desktop.background show-desktop-icons false
gsettings set org.gnome.shell.extensions.desktop-icons show-home false
gsettings set org.gnome.shell.extensions.desktop-icons show-trash false
gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size 32
gsettings set org.gnome.shell.extensions.dash-to-dock dock-fixed true
gsettings set org.gnome.shell.extensions.dash-to-dock show-mounts false
gsettings set org.gnome.shell.extensions.dash-to-dock custom-background-color true
gsettings set org.gnome.shell.extensions.dash-to-dock background-color '#000000'
gsettings set org.gnome.shell.extensions.dash-to-dock scroll-action 'cycle-windows'
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position 'LEFT'
gsettings set org.gnome.shell.extensions.dash-to-dock extend-height true
gsettings set org.gnome.desktop.interface show-battery-percentage true
gsettings set org.gnome.desktop.interface gtk-theme 'Yaru-dark'
gsettings set org.gnome.desktop.wm.keybindings close "['<Alt>q']"
gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ prev-tab '<Alt>Left'
gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ next-tab '<Alt>Right'
gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ new-tab '<Alt>t'
gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ close-tab '<Alt>w'
gsettings set org.gnome.settings-daemon.plugins.media-keys area-screenshot [""]
gsettings set org.gnome.settings-daemon.plugins.media-keys screenshot [""]
gsettings set org.gnome.settings-daemon.plugins.media-keys window-screenshot [""]
gsettings set org.gnome.settings-daemon.plugins.media-keys screenshot-clip [""]
gsettings set org.gnome.settings-daemon.plugins.media-keys screencast ["'<Shift><Alt>Print'"]
gsettings set org.gnome.settings-daemon.plugins.media-keys area-screenshot-clip ["'Print'"]
gsettings set org.gnome.settings-daemon.plugins.media-keys window-screenshot-clip ["'<Shift><Alt>Print'"]
sudo systemctl disable bluetooth.service

# setup ssh
ssh-keygen -t rsa
eval "$(ssh-agent -s)"

# update and upgrade
sudo apt update
sudo apt upgrade
sudo apt autoremove