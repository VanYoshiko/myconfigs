#!/bin/sh


ssh_dir="$HOME/Documents/.ssh"
public_key=$ssh_dir/id_ed25519.pub
private_key=$ssh_dir/id_ed25519
backup_dir="/private/var/mobile/Library/Mobile Documents/com~apple~CloudDocs/sharedlocal/home/"

set -e 
set -x 
exec 1> success.log 2> error.log

tee  error.log 
# handle_errors() {
# echo "Error"
# }

write_ssh_config() {
	echo "[INFO]: Creating .ssh/config..." 
	mkdir -p $ssh_dir 
	cat > $ssh_dir/config <<EOF
	Host github.com
	HostName github.com
	User git
	IdentityFile $private_key
	IdentitiesOnly yes
EOF
}

write_gitconfig() {
	echo "[INFO]: Creating .gitconfig..." 
	cat > ~/.gitconfig <<EOF
	[user]
	email = khorihenry@hotmail.com
	name = VanYoshiko
	[core]
	sshCommand = "ssh push --set-upstream origin main -i $private_key -F /dev/null"
EOF
}	

if [ ! -d $ssh_dir ]; then write_ssh_config && echo "📄 [Creating] $ssh_dir/config"
else
	echo "[SSH].ssh/config already exist."
fi
if [ ! .git ]; then
 echo "[INIT] Initializing repo..."
 git init .
else 
	echo "[INIT] Exisiting repo! Verifying hostkey..."
fi
if [ ! ssh -T git@github.com ]; then
	[ ! -f $public_key ] && echo "[INFO]: Making ssh keys..." && ssh-keygen -t ed25519 -f $private_key -C "khorihenry@hotmail.com" 2>/dev/null

echo "[INFO]: 🔑 Add this key to https://github.com/settings/keys"
cat $public_key
echo "[INFO] Add files to $backup_dir"
cp -nir $ssh_dir $backup_dir
ssh -T git@github.com
echo "$LNENO[INFO]: Manually adding user configs..."
git config --global user.identityFile "$private_key"
git config --global user.password ""
git config --global user.name "VanYoshiko"
git config --global user.email "khorihenry@hotmail.com"
fi
