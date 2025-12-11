#!/bin/sh

echo "lg2: a-Shell - git: ish"

# List of commands available in a-Sheell
lg2 help | tr '\n' ' '

# available commands {{{
# lg2 reset main

# Logging data for GitHub {{{

current=$(lg2 branch --list | grep "Checked out"| awk -F " " '{printf $1}')
remote=$(lg2 branch --list | grep -v "Checked out"| awk -F " " '{printf $1}')

printf "Display commit hash: %s \n" "$(lg2 log | grep "commit" | awk -F " " '{print $2}')"
printf "Display branches: Current: %s - Remote: %s\n" "$current" "$remote"
printf "Display Staged files: %d\n%s\n" "$(lg2 status --porcelain | sort | wc -l)"  "$(lg2 status --porcelain)"

# printf "Display private key permissions:\nSSH tokens:\n%s\nUser Configurations:\n %s" "$(ls ~/Documents/.ssh | grep -v "config" | awk -F " " '{print $1 $9}')" "$(cat ~/Documents/.ssh/config)"
# }}}

printf "Display files added to staging area:\n %s\n" "$(lg2 show-index)"
printf "Display files waiting to be committed:\n%s\n" "$(lg2 diff --cached --name-only)"
printf "Display files committed to local repository:\n%s\n" "$(lg2 log)"
printf "Display files in local repository:\n%s\nto remove files from local repository:\n%s\n" "$(lg2 ls-files)" "$(lg2 rm --cached *.webm)"
printf "Remove staged files:\nlg2 reset\n"
printf "Remove committed files:\nlg2 reset HEAD~\n"
printf "Display a file in remote repository:%s\n" "$(curl -s https://raw.githubusercontent.com/vanyoshiko/myconfigs/main/readme.md)"

#{{{



printf "Display files at remote head:\n%s\n" "$(lg2 ls-remote origin)"

printf "Using curl with GitHub API:\n%s\n" "$(curl -s https://api.github.com/repos/VanYoshiko/myconfigs/contents/)"

printf "Or for specific file:\n%s\n" "$(curl -s https://api.github.com/repos/VanYoshiko/myconfigs/contents/README.md)"

printf "Check what's on GitHub:\n%s\n" "$(curl -s https://api.github.com/repos/VanYoshiko/myconfigs/contents/ | jq '.[].name')"

printf "View README:\n%s\n" "$(curl -s https://raw.githubusercontent.com/VanYoshiko/myconfigs/main/README.md)"
