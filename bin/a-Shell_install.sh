#!/bin/sh

home_dir="/private/var/mobile/Library/Mobile Documents/com~apple~CloudDocs/sharedlocal/home"
plugin_dir="$HOME/Documents/.vim/pack/plugins/start"

config -s 14 -k block

echo "=====Copying dotfiles -> $HOME/Documents...===="
echo "Copying .profile..." 
cp "$home_dir/.profile" "$HOME/Documents" > /dev/null 
ls -la $HOME/Documents/.profile
echo "Copying .vimrc..." 
cp "$home_dir/.vimrc" "$HOME/Documents" > /dev/null 
ls -la $HOME/Documents/.vimrc
echo "Copying bin..." 
cp -R "$home_dir/bin" "$HOME/Documents" > /dev/null 
ls -m $HOME/Documents/bin
echo "Copying .ssh..." 
cp -R "$home_dir/.ssh" "$HOME/Documents" > /dev/null 
ls -m $HOME/Documents/.ssh

echo "=====Addind Plugins====="
mkdir -p "$plugin_dir" \ 
echo "Cloning vim-lsp.git... "
lg2 clone https://github.com/prabirshrestha/vim-lsp.git "$plugin_dir/vim-lsp.git" > /dev/null
ls -m "$plugin_dir/vim-lsp.git" 
echo "Cloning ale.git... "
lg2 clone https://github.com/dense-analysis/ale.git "$plugin_dir/ale.git" > /dev/null
ls -m "$plugin_dir/ale.git" 
echo "Cloning vim-lsp-ale.git... "
lg2 clone https://github.com/rhysd/vim-lsp-ale.git "$plugin_dir/vim-lsp-ale.git" > /dev/null
ls -m "$plugin_dir/vim-lsp-ale.git" 
echo "Cloning a-Shell commands..."
lg2 clone https://github.com/holzschu/a-Shell-commands.git "$plugin_dir/a-Shell-commands.git" > /dev/null
ls -m "$plugin_dir/a-Shell-commands.git" 
echo "Cloning a-Shell commands..."
lg2 clone https://github.com/vimwiki/vimwiki.git "$plugin_dir/vimwiki" > /dev/null
ls -m "$plugin_dir/vimwiki" 

pkg install tree
tree --version
