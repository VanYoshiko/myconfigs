#!/bin/sh

cd $HOME/Documents/bin || { echo " Error: Could not access ~/Documents/bin"
exit 1
}
find . -type l ! -exec test -e {} \; -delete 2>/dev/null
# Remove duplicates

printf "\nRemoving temporary files...\n"
rm -f *.zip *master *wasm3 2>/dev/null

printf "\nFinal bin content:"
ls -l
