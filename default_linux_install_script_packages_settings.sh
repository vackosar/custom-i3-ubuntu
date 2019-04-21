set -eux

INFO() {
  echo "$@";
}

INFO update
sudo apt update && sudo apt upgrade -y


INFO ssh setup

if [ ! -e ~/.ssh/id_rsa.pub ]; then
  ssh-keygen -b 4096;
fi


INFO install dropbox 
sudo apt install -y make;
ln -s ~/Dropbox ~/dropbox || true;


INFO additional dirs
mkdir ~/src ||true;
ln -s ~/Downloads ~/downloads ||true;


INFO install general packages
sudo apt install -y apt-transport-https curl;
sudo snap install intellij-idea-ultimate --classic;
sudo apt install -y terminator i3 libreoffice vim pavucontrol xfce4-power-manager keepass2 vlc build-essential python-dev python-tk calibre ffmpeg;
sudo apt remove -y gnome-terminal;
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -O ~/downloads/google-chrome-stable_current_amd64.deb;
sudo dpkg -i ~/downloads/google-chrome-stable_current_amd64.deb;
sudo apt install -y virtualbox nodejs python3.7 python3.7-dev;


INFO install Anki
pushd ~/downloads;
if [ ! -f anki.tar.bz2 ]; then
	wget https://apps.ankiweb.net/downloads/current/anki-2.1.11-linux-amd64.tar.bz2 -O anki.tar.bz2;
fi;
tar xjf anki.tar.bz2;
cd anki*amd64;
sudo make install;
popd;
setsid anki|| true;


INFO md2pdf
sudo apt install -y pandoc wkhtmltopdf;


INFO Git config
sudo apt install -y git

git config --global core.editor vi;
git config --global user.email "admin@vaclavkosar.com";
git config --global user.name 'vackosar';
git config --global alias.co checkout;
git config --global alias.br branch;
git config --global alias.ci 'commit -m';
git config --global alias.st status;


INFO custom bashrc, profile, bin
cp -ran home/* ~/;


INFO install youtube-dl
sudo apt install -y python-pip
pip install youtube-dl;
ln -s ~/.local/bin/youtube-dl ~/bin/youtube-dl || true;


INFO install Syncthing
sudo apt install -y syncthing;
# copy systemd to home dir
systemctl --user enable syncthing.service;
systemctl --user start syncthing.service;


echo "source .profile-custom.sh" >> ~/.profile
# profile-custom is part of home dir
echo "source .bash-custom.sh" >> ~/.bashrc
# bashrc-custom is part of home dir
source ~/.bashrc;


INFO vim setup
echo "set clipboard^=unnamed,unnamedplus" >> ~/.vimrc;
echo "source ~/.vimrc" >> ~/.ideavimrc;


INFO vpn
sudo apt install -y network-manager-openvpn network-manager-openvpn-gnome;
sudo nmcli connection import type openvpn file ~/Dropbox/sync/rsr/vackosar-vpn.ovpn;



INFO min brightness
cat - > ~/bin/minimizeBrightness.sh <<EOF
echo 25 | sudo tee /sys/class/backlight/intel_backlight/brightness
EOF
chmod u+x ~/bin/minimizeBrightness.sh;


INFO create web link apps
sudo apt install -y chromium-browser;
createWebLinkApp.sh https://www.youtube.com youtube
# the script is part of bin home folder


INFO comms
sudo snap install skype --classic;
setsid skype|| true;
createWebLinkApp.sh https://www.slack.com slack;
setsid slack ||true;
sudo apt install -y thunderbird;
setsid thunderbird ||true;


INFO I3 gnome
sudo apt install -y i3 i3-wm
sudo apt install -y gdm3
sudo apt install -y gnome-flashback build-essential
mkdir ~/src || true;
cd ~/src;
git clone https://github.com/csxr/i3-gnome.git;
cd i3-gnome;
sudo make install;
# i3 config is part of home


INFO Gen keys
genKey() { name="$1";
	if [ ! -f "$HOME/$name-rsa" ]; then
		ssh-keygen -b 4096 -f "$HOME/.ssh/$name-rsa";
	fi;
}
genKey "til";
genKey "tsl";
