#!/bin/sh

# Open PDF help files using internalbrowser for A-shell !
clear
pdf_list=$(find /private/var/mobile/Library/Mobile\ Documents/com~apple~CloudDocs/sharedlocal/home/.local/share/images/pdf -name *.pdf  ) | awk -F "/" 'BEGIN { c = 1} { print c++ "\t" $14 "\t" $15 }' 

echo "===== PDF LIST ====="


echo "Enter number:"
read num

count=$(echo "$pdf_list" | wc -l)
[ "$num" -ge 1 ] && [ "$num" -le "$count" ] || {
	echo "Invalid!" >&2
	exit 1
}

i=1
for pdf in $pdf_list; do
	[ "$i" -eq "$num" ] && {
		internalbrowser $pdf
			break
		}
		i=$((i + 1))
	done
	echo "internalbrowser $pdf"

