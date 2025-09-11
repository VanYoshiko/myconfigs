#!/bin/sh


# echo "📄 Creating .ssh/config..." 
# mkdir -p ~/.ssh 
# cat > ~/.ssh/config <<EOF
# Host github.com
# HostName github.com
# User git
# IdentityFile ~/.ssh/id_ed25519
# IdentitiesOnly yes
# EOF
# 
# echo "📄 Creating .gitconfig..." 
# cat > ~/.gitconfig <<EOF
# [user]
# email = khorihenry@hotmail.com
# name = VanYoshiko
# [core]
# sshCommand = "ssh -i ~/.ssh/id_ed25519 -F /dev/null"
# EOF

# echo "# myconfigs" >> README.md
# echo "Initiating repo"
# if ! git init .; then
# Using 'master' as the name for the initial branch. This default branch name is subject to change. To configure the initial branch name to use in all of your new repositories, which will suppress this warning, call:
# git config --global init.defaultBranch master
# fi
# echo "======================================="
# echo "Making ssh keys..."
# ssh-keygen -t ed25519 -f ~/.ssh/id_ed25519 -C "khorihenry@hotmail.com" 2>/dev/null
# exit_code="$?"
# if [ $exit_code -eq 127 ]; then
# 	echo "ssh-keygen: not found"
# 	echo "======================================="
# 	echo "Installing openssh_client..."
# 	apk add openssh-client
# 	echo "======================================="
# 	echo "Making ssh keys..."
# 	ssh-keygen -T ed25519 -f ~/.ssh/id_ed25519 -C "khorihenry@hotmail.com"
# elif [ $exit_code -ne 0 ]; then 
# 	echo "Ssh-keygen failed with unexpected error: $exit_code"
# fi
# echo "======================================="
# echo "🔑 Add this key to https://github.com/settings/keys"
# cat ~/.ssh/id_ed25519.pub
# echo "======================================="
# cp -r .ssh/ ~/.ssh >dev/null
# ssh -T git@github.com

echo "======================================="
echo "Manually adding user configs..."
git config user.identityFile "~/.ssh/id_ed25519"
git config user.password ""
git config user.name "VanYoshiko"
git config user.email "khorihenry@hotmail.com"

echo "======================================="
# echo "Setting token permissions..."
# chmod 600 ~/.ssh/id_ed25519 >dev/null
# chmod 644 ~/.ssh/id_ed25519.pub >dev/null
# chmod 600 ~/.ssh/config >dev/null
# chmod 700 ~/.ssh >dev/null
# echo "======================================="
# ### fatal: detected dubious ownership in repository at '/mnt/sharedlocal/irok'
# echo "To add an exception for this directory, call:"
# 
# git config --global --add safe.directory /mnt/sharedlocal/irok
# echo "======================================="
# 
# git pull 
# echo "======================================="
# git add README.md
# echo "======================================="
# git commit -m "Commits"
# echo "======================================="
# git branch -M main
# echo "======================================="
# git remote add origin git@github.com:VanYoshiko/myconfigs.git
# echo "======================================="
# git push origin 
