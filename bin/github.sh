#!/bin/sh

set -e
exec 2> err_log.txt

handle_errors() {
local exit_code=$?
local command=$1
local output=$2
echo "ERROR: Command failed: $command"
echo "Exit code: $exit_code"
echo "Output: $output"
case $exit_code in
	128)
if echo "$pull_output" | grep -q "dubious ownership"; then
	echo "DEBUG: Adding to safe.directory..."
	git config --global --add safe.directory /mnt/sharedlocal/irok
	return 1
fi
	;;
	1)
	if echo "$pull_output" | grep -q "Pulling without specifying how to reconcile"; then
		echo "DEBUG: Configuring pull stratergy..."
		git config pull.rebase false
	   git pull origin main --allow-unrelated-histories
	return 1
	fi
	if echo "$outpit" | grep -q "non-fast-forward"; then
		echo "DEBUG: Handling non-fast forward error...
	git pull origin main --allow-unrelated-history"
	return 1
	fi
		if echo "$output" | grep -q "rejected"; then
		echo "DEBUG: force push..."
		git push --force origin main
		return 1
		fi
		;;
	*)
	echo "Unhandled error"
	exit $exit_code
	;;	
esac
}

# echo "INFO: Creating .ssh/config..." 
# mkdir -p ~/.ssh 
# cat > ~/.ssh/config <<EOF
# Host github.com
# HostName github.com
# User git
# IdentityFile ~/.ssh/id_ed25519
# IdentitiesOnly yes
# EOF
# 
# echo "INFO: Creating .gitconfig..." 
# cat > ~/.gitconfig <<EOF
# [user]
# email = khorihenry@hotmail.com
# name = VanYoshiko
# [core]
# sshCommand = "ssh -i ~/.ssh/id_ed25519 -F /dev/null"
# EOF

# echo "======================================="
# echo "# myconfigs" >> README.md
# echo "INFO: Initiating repo"
# if ! git init .; then
# Using 'master' as the name for the initial branch. This default branch name is subject to change. To configure the initial branch name to use in all of your new repositories, which will suppress this warning, call:
# echo "INFO: Using master branch"
# git config --global init.defaultBranch master
# fi
# echo "======================================="

# echo "INFO: Making ssh keys..."
# ssh-keygen -t ed25519 -f ~/.ssh/id_ed25519 -C "khorihenry@hotmail.com" 2>/dev/null
# exit_code="$?"
# if [ $exit_code -eq 127 ]; then
# 	echo "WARN: ssh-keygen: not found"
# 	echo "======================================="
# 	echo "INFO; Installing openssh_client..."
# 	apk add openssh-client
# 	echo "======================================="
# 	echo "INFO: Making ssh keys..."
# 	ssh-keygen -T ed25519 -f ~/.ssh/id_ed25519 -C "khorihenry@hotmail.com"
# elif [ $exit_code -ne 0 ]; then 
# 	echo "WARN: Ssh-keygen failed with unexpected error: $exit_code"
# fi
# echo "======================================="
# echo "INFO: 🔑 Add this key to https://github.com/settings/keys"
# cat ~/.ssh/id_ed25519.pub
# echo "======================================="
# cp -r .ssh/ ~/.ssh >dev/null
# ssh -T git@github.com

# echo "======================================="
# echo "INFO: Manually adding user configs..."
# git config --global user.identityFile "~/.ssh/id_ed25519"
# git config --global user.password ""
# git config --global user.name "VanYoshiko"
# git config --global user.email "khorihenry@hotmail.com"

# echo "======================================="
# echo "INFO: Setting token permissions..."
# if [! -d .ssh ]; then
# mkdir ~/.ssh/config
# chmod 600 ~/.ssh/id_ed25519 >/dev/null
# chmod 644 ~/.ssh/id_ed25519.pub >/dev/null
# chmod 600 ~/.ssh/config >/dev/null
# chmod 700 ~/.ssh >/dev/null
# else
# 	echo "->INFO: Tokens already exists!"
# fi
# echo "======================================="
 
echo "=Pulling from remote...================"
pull_output=$(git pull origin main 2>&1) || handle_errors "git pull" "$pull_output"
echo "=Add files...=========================="
git add .
add_output=$(git add . 2>&1)
exit_code=$?
if [ $exit_code -eq 0 ]; then
	if echo "$add_output" | grep -q "adding embedded git repository"; then
		echo "WARN: Embedded repo detected"
	fi
elif [ $exit_code -eq 1 ]; then 
	echo "ERROR: Failed to add files"
fi
echo "=Committing files...==================="
git commit -m "Commits"
# echo "=Adding origin...======================"
# git remote add origin git@github.com:VanYoshiko/myconfigs.git
echo "=Pushing to remote...=================="
push_output=$(git push origin main 2>&1) || handle_errors "git push" "$push_output"
