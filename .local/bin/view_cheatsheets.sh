#!/bin/sh
clear

home_dir="/private/var/mobile/Library/Mobile Documents/com~apple~CloudDocs/sharedlocal/home"
pdf_dir="/private/var/mobile/Library/Mobile Documents/com~apple~CloudDocs/sharedlocal/home/.local/share/images/pdf/cheatsheet"
syllabus_dir="$pdf_dir/../syllabus"

# echo "======📂PDF_DIR====="
# ls "$pdf_dir"
# ls "$home_dir"
# echo "======📂SYL_DIR====="
# ls "$syllabus_dir"

for file in "$pdf_dir"/*.pdf; do
# 	echo "Found file: $file"
	if [ -f "$file" ]; then
		set -- "$@" "$file"
	fi
done

for file in "$syllabus_dir"/*.pdf; do
# 	echo "Found syllabus PDF: $file"
	if [ -f "$file" ]; then
		set -- "$@" "$file"
	fi
done

# echo "First: $1"
# echo "Second: $2"
# echo "Third: $3"
# echo "Fourth: $4"
echo "Select from 1-$# to view pdf"
echo "=====PDF LIST====="
i=1
for pdf in "$@"; do
	echo "$i. $(basename "$pdf")"
	i=$((i+1))
done

echo "================================="
echo "Enter selection:"
read choice
echo "================================="
if [ "$choice" -ge 1 ] && [ "$choice" -le $# ]; then
	selected=$(eval echo "\$$choice")
	echo "opening $(basename "$selected")"
	view "$selected"
fi

