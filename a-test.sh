#!/bin/sh


date_str=$(date +%Y-%m-%d)
 echo "Today is $date_str"
home_dir="/private/var/mobile/Library/Mobile Documents/com~apple~CloudDocs/sharedlocal/home"

for file in "$home_dir/.profile" "$home_dir/.vimrc" "$home_dir/bin" "$home_dir/.ssh"; do 
	cp -Rn "$file" "$HOME/Documents"
	echo "[SYNC] $file"
done
