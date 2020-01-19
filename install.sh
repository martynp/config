#!/usr/bin/env python3

# TODO:
# 1. Check internet connection
# 2. Download theme && install for gnome-terminal
# 3. Download fish theme
# 4. Install neovim plugin manager + plugins

config_home=`pwd`

### SYSTEM INSTALLS ###

# Install from repositories
sudo yum install tmux neovim cmake3 bzip2-devel ncurses-devel readline-devel libedit-devel

### NODEJS ###
wget https://nodejs.org/download/release/v8.11.4/node-v8.11.4.tar.gz
cd node-v8.11.4.tar.gz
./configure
make
sudo make install
cd ../ && rm -rf ./node-v8*

### FONTS ###

# Download & extract the fonts #
wget https://noto-website-2.storage.googleapis.com/pkgs/NotoSansMono-hinted.zip
mkdir noto && cd noto
unzip ../NotoSansMono-hinted.zip
cd ../
rm NanoSansMono-hinted.zip

# Install the fonts (TODO: Update install for all users)
# (Check not installed first...)
sudo mkdir -p /usr/share/fonts/opentype/noto
sudo cp -r ./noto/* /usr/share/fonts/opentype/noto/*

# Remove temporary files
rm -rf ./noto


### Templates ###

git clone https://github.com/chriskempson/base16-gnome-terminal.git ~/.config/base16-gnome-terminal
source ~/.config/base16-gnome-terminal/base16-atelierdune.dark.sh
cd ~/.config/
git clone https://github.com/chriskempson/base16-shell.git
cd $config_home

### FISH SHELL ###

# Download and install fish shell
git clone https://github.com/fish-shell/fish-shell.git
cd fish-shell
mkdir build
cd build
cmake3 ..
make
sudo make install
cd $config_home

# Copy over confgs
mkdir -p ~/.configs/fish/
cp ./configs/fish/* ~/.configs/fish/

# Delete temporary files
rm -rf fish-shell

### NEOVIM Plugins ###

# Install the plugin manager
mkdir -p ~/.config/nvim/autoload
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Copy across the config file
cp ./configs/neovim/* ~/.configs/nvim/
