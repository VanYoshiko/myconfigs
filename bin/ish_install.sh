#!/bin/sh

home_dir=/mnt/sharedlocal/irok

\n echo "=====Dot Files====="
echo "Copying dotfiles to $HOME.."
echo "Copying .bash_profile to $HOME.."
cp $home_dir/.bash_profile $HOME > /dev/null
ls -a ~/.bash_profile
echo "Copying gitconfig  to $HOME.."
cp $home_dir/.gitconfig $HOME > /dev/null
ls -a ~/.gitconfig
echo "Copying gitignore  to $HOME.."
cp $home_dir/.gitignore $HOME > /dev/null
ls -a ~/.gitignore
echo "Copying vimrc  to $HOME.."
cp $home_dir/.vimrc $HOME > /dev/null
ls -a ~/.vimrc
echo "Copying .ssh to $HOME.."
cp -r  $home_dir/.ssh $HOME > /dev/null
ls ~/.ssh
echo "Copying .muttrc to $HOME.."
cp $home_dir/.muttrc $HOME > /dev/null
ls -a ~/.muttrc 
\n

echo "=====Adding Packages====="\n
echo "Updating & Upgarding..."
apk update > /dev/null
apk upgrade > /dev/null
echo "Installing py3-pip..."
apk add "py3-pip" > /dev/null
apk list py3-pip
echo "Installing python3..." 
apk add "python3" > /dev/null
apk list python3 
echo "Installing vim..." 
apk add vim > /dev/null
apk list vim 
echo "Installing git..."
apk add git > /dev/null
apk list git 
echo "Installing sqlite..."
apk add sqlite > /dev/null
apk list sqlite 
echo "Installing mutt..."
apk add mutt > /dev/null
apk list mutt 
echo "Installing curl..."
apk add curl > /dev/null
apk list curl 
echo "Installing tree..."
apk add tree > /dev/null
apk list tree 
echo "Installing lynx..."
apk add lynx > /dev/null
apk list lynx 
echo "Installing bash..."
apk add bash > /dev/null
apk list bash 
echo "Installing openssh-client..."
apk add openssh-client
apk list openssh-client
echo "===Packages installed:==="
echo "User: $(whoami), Host: $(uname -s), Kernal: $(uname -r), Arch: $(uname -m), Cpu: $(getconf _NPROCESSORS_ONLN)"
