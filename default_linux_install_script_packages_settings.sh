set -eux

INFO() {
  echo "$@";
}


INFO ssh setup

if [ ! -e ~/.ssh/id_rsa.pub ]; then
  ssh-keygen -b 4096;
fi


INFO install dropbox 
sudo apt install make;
ln -s ~/Dropbox ~/dropbox || true;


INFO install general packages
sudo snap install intellij-idea-ultimate --classic;
sudo apt install -y terminator thunderbird i3 libreoffice vim pavucontrol xfce4-power-manager keepass2 vlc build-essential python-dev python-tk calibre;
sudo apt remove -y gnome-terminal;


INFO md2pdf
sudo apt install pandoc wkhtmltopdf;


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

echo "source .profile-custom.sh" >> ~/.profile
# profile-custom is part of home dir
echo "source .bash-custom.sh" >> ~/.bashrc
# bashrc-custom is part of home dir

INFO vim setup
echo "set clipboard^=unnamed,unnamedplus" >> ~/.vimrc;
echo "source ~/.vimrc" >> ~/.ideavimrc;


INFO vpn
sudo apt install -y network-manager-openvpn network-manager-openvpn-gnome;
sudo nmcli connection import type openvpn file ~/Dropbox/sync/rsr/vackosar-vpn.ovpn;


INFO custom bin
mkdir ~/bin;


INFO min brightness
cat - > ~/bin/minimizeBrightness.sh <<EOF
echo 25 | sudo tee /sys/class/backlight/intel_backlight/brightness
EOF
chmod u+x ~/bin/minimizeBrightness.sh;


INFO create web link app     
sudo apt install -y chromium-browser;


INFO i3 gnome
sudo apt install -y i3 i3-wm
sudo apt install -y gdm3
sudo apt install -y gnome-flashback build-essential
mkdir ~/src || true;
cd ~/src;
git clone https://github.com/csxr/i3-gnome.git;
cd i3-gnome;
sudo make install;
# i3 config is part of home

