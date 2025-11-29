#!/bin/sh

# a-Shell rules:
# lg2 checkout -b main - Crash!
# No command expansions, heredocs, eval
# Usage in merge conflicts where remote files are different from local:
# lg2 reset --hard HEAD
# ERRORS:
# Error pushing [-11] - cannot push non-fastforwardable reference

home_dir="/private/var/mobile/Library/Mobile Documents/com~apple~CloudDocs/sharedlocal/home"
gitconfig="$HOME/Documents/.gitconfig"
ssh_dir="$HOME/Documents/.ssh"
pub_key="$ssh_dir/id_ed25519.pub"
pri_key="$ssh_dir/id_ed25519"
output_log="$home_dir/bin/output.log"
err_log="$home_dir/bin/err.log"

set -x 
set -e

date >> $output_log 2>&1
	echo "" && echo "====== github =======================" >> $err_log  2>&1
date >> $err_log  2>&1

create_keygen() {
	ssh-keygen -t ed25519 -f $pri_key -N "" -C "khorihenry@hotmail.com"  >> $output_log 2>&1
	# 	echo "[INFO] Installing openssh_client..."
	echo "$LINENO [INFO] 🔑 Add this key to https://github.com/settings/keys" >> $output_log 2>&1
	cat $pub_key
}

create_gitconfig() {
	echo "[user]" >> $gitconfig >/dev/null
	echo "  name = VanYoshiko" >> $gitconfig >/dev/null
	echo "  email = khorihenry@hotmail.com" >> $gitconfig >/dev/null
	echo "  identityFile = "$HOME/Documents/.ssh/id_ed25519"" >> $gitconfig >/dev/null
	echo "Created global configuration file"
	cat $gitconfig
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
	echo "$LINENO [INFO] Manually adding user configs..."
	lg2 config user.identityFile "$ssh_dir/id_ed25519"
	lg2 config user.password ""
	lg2 config user.name "VanYoshiko"
	lg2 config user.email "khorihenry@hotmail.com"
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

echo "" && echo "========= github_old ====================="
echo "$LINENO [INFO] Initiating repo"
rm -rf .git >/dev/null
lg2 init . >> $output_log 2>&1
user_configs >> $output_log 2>&1
# lg2 ls-remote origin >> $output_log 2>&1

echo "$LINENO [INFO] Pulling from remote..."
# lg2 pull  >> $output_log 2>&1
# lg2 pull origin main --allow-unrelated-histories >> $output_log 2>&1

echo "$LINENO [INFO] Adding files..."
echo "# Irok-OS imported with a-shell" >> README.md
lg2 add . >> $output_log 2>&1
lg2 status
cat "$HOME/Documents/.gitignore"

echo "$LINENO [INFO] Committing files"
lg2 commit -m "Adding all files. Expections .gitignore" >> $output_log 2>&1
lg2 log

echo "$LINENO [INFO] Creating remote main branch"
lg2 branch main >> $output_log 2>&1
lg2 checkout main >> $output_log 2>&1
lg2 branch --list

echo "$LINENO [INFO] Adding remote"
# lg2 ls-remote origin
lg2 ls-remote git@github.com:VanYoshiko/myconfigs.git
lg2 remote add origin git@github.com:VanYoshiko/myconfigs.git  >> $output_log 2>&1
echo "$LINENO [INFO] Fetching remote branches"
# lg2 fetch origin 2>> $err_log 
# lg2 rebase origin 2>> $err_log

echo "$LINENO [INFO] Pushing to remote "
lg2 push origin 2>> $err_log 
