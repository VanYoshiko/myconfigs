#!/bin/sh

home_dir="/private/var/mobile/Library/Mobile Documents/com~apple~CloudDocs/sharedlocal/home"
gitconfig="$HOME/Documents/.gitconfig"
ssh_dir="$HOME/Documents/.ssh"
pub_key="$ssh_dir/id_ed25519.pub"
pri_key="$ssh_dir/id_ed25519"
output_log="$home_dir/bin/output.log"
err_log="$home_dir/bin/err.log"

create_keygen() {
	ssh-keygen -t ed25519 -f $pri_key -N "" -C "khorihenry@hotmail.com"  >> $output_log 2>&1
	# 	echo "[INFO] Installing openssh_client..."
	echo "$LINENO [INFO] 🔑 Add this key to https://github.com/settings/keys" >> $output_log 2>&1
	cat $pub_key
}

create_gitconfig() {
	printf "%s\n %s\n %s\n %s\n" "[user]" "name = VanYoshiko"  "email = khorihenry@hotmail.com" "identityFile = $HOME/Documents/.ssh/id_ed25519" > $gitconfig
	echo "Created global configuration file"
}

permissions() {
	mkdir $ssh_dir/config
	chmod 600 $pri_key >/dev/null
	chmod 644 $pub_key >/dev/null
	chmod 600 $ssh_dir/config >/dev/null
	chmod 700 $ssh_dir >/dev/null
	echo "Permissions set"
	ls "$ssh_dir"
}

user_configs() {
	lg2 config user.identityFile "$ssh_dir/id_ed25519"
	lg2 config user.password ""
	lg2 config user.name "VanYoshiko"
	lg2 config user.email "khorihenry@hotmail.com"
	echo "$LINENO [INFO] Manually adding user configs..."
}

if [ ! -f $gitconfig ]; then 
	echo "$LINENO [INFO] Creating $gitconfig"
	create_gitconfig >> $output_log 2>&1
	cat "$gitconfig"
else
	cat "$gitconfig"
fi

if [ ! -f $pri_key ]; then 
	echo "$LINENO [INFO-SSH] Making ssh keys"
	create_keygen >> $output_log 2>&1
	permissions >> $output_log 2>&1
else
	ls -a "$ssh_dir"
fi

