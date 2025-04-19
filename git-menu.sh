# Step 1  - GitHub Setup{{{
# Step 2    - Complete ssh-key Reset{{{
# rm -rf ~/Documents/.ssh
# mkdir -p ~/Documents/.ssh
# chmod 700 ~/Documents/.ssh}}}

# Step 3      - Create ssk-keygen for a-Shell {{{
#ssh-keygen -t ed25519 -f ~/Documents/.ssh/id_ed25519 -C "khorihenry@hotmail.com"#}}}

# Step 4        - Display id_ed25519.pub key to copy to GitHub{{{
# cat ~/Documents/.ssh/id_ed25519.pub}}}

# Step 5          - Set ssh-key permissions{{{
# chmod 600 ~/Documents/.ssh/id_ed25519
# chmod  644 ~/Documents/.ssh/id_ed25519.pub}}}

# Step 6      - Manually add GitHub to known_hosts{{{
# echo "github.com ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOMqqnkVzrm0SdG6UOoqKLsabgH5C9okWi0dh2l9GKJl" > ~/Documents/.ssh/known_hosts
# chmod 644 ~/Documents/.ssh/known_hosts
#}}}

# Step 7 - test ssh connection{{{
# ssh -T git@github.com}}}

# Step 8 - Push with explicit paths{{{
# GIT_SSH_COMMAND="ssh -i ~/Documents/.ssh/id_ed25519 -F UserKnownHostsFile=~/Documents/.ssh/known_hosts" git push origin main
#}}}

# Step 9 - IMPORTANT -> Verify key-Fingerprint{{{
# ssh-keygen -lf ~/.ssh/id_ed25519.pub  # iSH
# ssh-keygen -lf ~/Documents/.ssh/id_ed25519.pub  # a-Shell}}}

# Step 10 - Alternative Https method{{{
# git remote set-url origin https://github.com/VanYoshiko/Yoshi.git}}}

# Step 11 - git push origin main #export GIT_SSH=$(which ssh)#{{{
#git push origin maintenance#}}}

# Step 12 - Add GitHub to known_hosts{{{
#ssh-keyscan github.com >> ~/.ssh/known_hosts}}}

#echo Push with verbose output..."#{{{
#GIT_TRACE=1 GIT_SSH_COMMAND="ssh -v" git push origin main#}}}#}}}

