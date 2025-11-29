#!/bin/sh

set -e
set -x

gitconfig="$HOME/.gitconfig"
ssh_dir="$HOME/.ssh"
pub_key="$ssh_dir/id_ed25519.pub"
pri_key="$ssh_dir/id_ed25519" 
home_dir=/mnt/sharedlocal/home
output="$home_dir/bin/output.log"
error="$home_dir/bin/err.log"

token_permissions() {
	echo "Setting token permissions..."
	chmod 600 $pri_key 
	chmod 644 $pub_key 
	chmod 600 $gitconfig
	chmod 700 $ssh_dir 
}

dubious_ownership() {
echo "$LINENO Clearing dubious ownerships..."
# git config --global --add safe.directory $home_dir/freshstart
}

remote() {
	git remote remove origin 2>/dev/null || true
	git remote add origin git@github.com:VanYoshiko/myconfigs.git
	git remote -v
}

ssh_keys() {
	echo "$LINENO Making ssh keys..."
	ssh-keygen -t ed25519 -f $pri_key -N "" -C "khorihenry@hotmail.com" 
	exit_code="$?"
	echo "[INSTALLING] openssh_client..."
	apk add openssh-client
	echo "🔑 Add this key to https://github.com/settings/keys"
	cat $pub_key
	token_permissions
}

gitconfig() {
	echo "📄 $LINENO [CREATING] .gitconfig..." 
	cat > $gitconfig  <<EOF
[user]
email = khorihenry@hotmail.com
name = VanYoshiko
[core]
sshCommand = "ssh -i $pri_key -F /dev/null"
EOF
	cat $gitconfig
}

branch_default() {
	git config --global init.defaultBranch main
	git init .
	echo "$LINENO Renaming branch from master to..."
	ls .git/refs/heads
}

if [ ! -f $gitconfig ]; then
	gitconfig
else 
	echo "📄 $LINENO $gitconfig"
	cat "$gitconfig"
fi

echo "# freshstart" >> README.md
echo "$LINENO ================================="
if [ ! -d .git ]; then
	branch_default
fi

echo "$LINENO ================================="
if [ ! -f "$pri_key" ]; then
	ssh_keys
else
	cp -ur $home_dir/.ssh $ssh_dir >/dev/null && token_permissions
fi

echo "$LINENO ================================="
dubious_ownership
echo "$LINENO ======================================="
remote
echo "$LINENO ================================="
# git pull 
echo "$LINENO ================================="
cat > README.md <<EOF
# Myconfigs
EOF

echo "$LINENO ======================================="
git add *.sh
git status
echo "Ignored files/directories..."
cat ~/.gitignore
echo "$LINENO ================================="
git commit -m "Freshstart comit"
git log
echo "$LINENO ================================="
git push origin main
# git push --set-upstream origin main

