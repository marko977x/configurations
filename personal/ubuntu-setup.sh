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
	sudo install -y -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
	sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
	sudo rm -f packages.microsoft.gpg
	sudo apt install -y apt-transport-https
	sudo apt update
	sudo apt install -y code
  sudo apt purge gedit
fi

# get docker
# read -p "Do you wish to install docker? (y/n)" yn
if [[ $yn == "y" ]] || [[ $yn == "" ]]; then
  sudo apt install -y ca-certificates curl gnupg lsb-release
  sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
  sudo echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
  sudo apt update -y
  sudo apt install docker-ce docker-ce-cli containerd.io
fi

# get anydesk
# read -p "Do you wish to install anydesk? (y/n)" yn
if [[ $yn == "y" ]] || [[ $yn == "" ]]; then
  sudo wget -qO - https://keys.anydesk.com/repos/DEB-GPG-KEY | sudo apt-key add -
  sudo echo "deb http://deb.anydesk.com/ all main" | sudo tee /etc/apt/sources.list.d/anydesk-stable.list
  sudo apt update -y
  sudo apt install -y anydesk
fi

# get skype
# read -p "Do you wish to install skype? (y/n)" yn
if [[ $yn == "y" ]] || [[ $yn == "" ]]; then
  sudo wget https://go.skype.com/skypeforlinux-64.deb
  sudo apt install -y ./skypeforlinux-64.deb
  sudo rm -r skypeforlinux-64.deb
fi

# get thunderbird
# read -p "Do you wish to install thunderbird? (y/n)" yn
if [[ $yn == "y" ]] || [[ $yn == "" ]]; then
  sudo apt install -y thunderbird
fi

# get qbittorrent
# read -p "Do you wish to install qbittorrent? (y/n)" yn
if [[ $yn == "y" ]] || [[ $yn == "" ]]; then
  sudo apt install -y qbittorrent
fi

# get vlc
# read -p "Do you wish to install vlc? (y/n)" yn
if [[ $yn == "y" ]] || [[ $yn == "" ]]; then
  sudo apt install -y vlc
fi

# get wps
# read -p "Do you wish to install wps office? (y/n)" yn
if [[ $yn == "y" ]] || [[ $yn == "" ]]; then
  mkdir wps && cd wps
  wget https://wdl1.pcfg.cache.wpscdn.com/wpsdl/wpsoffice/download/linux/10702/wps-office_11.1.0.10702.XA_amd64.deb
  sudo dpkg -i wps-office_11.1.0.10702.XA_amd64.deb
  sudo apt install -y ./wps-office_11.1.0.10702.XA_amd64.deb -y
  cd ../ && rm -rf wps
fi

# TODO
# rm -rf ~/Templates/*
# touch ~/Templates/Document.doc
# touch ~/Templates/Spreadsheet.xls
# touch ~/Templates/Powerpoint.ppt

mkdir libs && cd libs
# solves problem with anydesk on ubuntu 22
http://ftp.de.debian.org/debian/pool/main/p/pangox-compat/libpangox-1.0-0_0.0.2-5.1_amd64.deb
sudo dpkg -i libpangox-1.0-0_0.0.2-5.1_amd64.deb
# solves problem with wps on ubuntu 22
wget http://nz2.archive.ubuntu.com/ubuntu/pool/main/o/openssl/libssl1.1_1.1.1l-1ubuntu1.3_amd64.deb
sudo dpkg -i libssl1.1_1.1.1l-1ubuntu1.3_amd64.deb
cd ../ && rm -rf libs

# set solid black background
gsettings set org.gnome.desktop.background primary-color '#000000'
gsettings reset org.gnome.desktop.background color-shading-type
gsettings set org.gnome.desktop.background picture-uri ''
gsettings set org.gnome.desktop.background picture-uri-dark ''

# # setup terminal
# dconf load /org/gnome/terminal/legacy/profiles:/ < $(pwd)/gnome-terminal-profiles.dconf

# # fonts
sudo apt install -y fonts-firacode

# basic setup
sudo apt install gnome-tweaks
sudo apt install gnome-shell-extensions
gsettings set org.gnome.shell favorite-apps "['org.gnome.Nautilus.desktop', 'org.gnome.Terminal.desktop', 'google-chrome.desktop', 'code.desktop']"
gsettings set org.gnome.desktop.background show-desktop-icons false
# this one is for ubuntu 20
gsettings set org.gnome.shell.extensions.desktop-icons show-home false
# this one is for ubuntu 22
gsettings set org.gnome.shell.extensions.ding show-home false
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
ssh-keygen -t ed25519
eval "$(ssh-agent -s)"
ssh-add

# update and upgrade
sudo apt update -y
sudo apt upgrade -y
sudo apt autoremove -y