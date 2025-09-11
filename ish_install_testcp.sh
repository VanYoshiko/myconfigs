#!/bin/sh

home_dir=/mnt/sharedlocal/home

echo "Copying dotfiles to $HOME.."
cp $home_dir/.profile $HOME > /dev/null
echo "Copying profile  to $HOME.."
cp $home_dir/.gitconfig $HOME > /dev/null
echo "Copying gitconfig  to $HOME.."
cp $home_dir/.gitignore $HOME > /dev/null
echo "Copying gitignore  to $HOME.."
cp $home_dir/.vimrc $HOME > /dev/null
echo "Copying vimrc  to $HOME.."

# mount -t ios . /mnt
apk update > /dev/null && apk upgrade > /dev/null/ && echo "Updating & Upgarding..."
apk add py3-pip > /dev/null && echo "Installing py3-pip"
apk add python3 > /dev/null && echo "Installing python3"
apk add vim > /dev/null && echo "Installing vim"
apk add git > /dev/null && echo "Installing git"
apk add sqlite > /dev/null && echo "Installing sqlite"
apk add mutt > /dev/null && echo "Installing mutt"
apk add curl > /dev/null && echo "Installing curl"
apk add tree > /dev/null && echo "Installing tree"
apk add lynx > /dev/null && echo "Installing lynx"
apk add bash > /dev/null && echo "Installing bash"
echo "===Packages installed:==="
apk list bash lynx tree curl mutt sqlite vim git python3 py3-pip 
echo "User: $(whoami), Host: $(uname -s), Kernal: $(uname -r), Arch: $(uname -m), Cpu: $(getconf _NPROCESSORS_ONLN)"
