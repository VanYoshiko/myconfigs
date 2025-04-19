#!/bin/sh
# Function to display vimscript popup menu
clear
show_menu(){
	echo "========================================="
	echo "Initial setup menu"
	echo "1) Install Configurations"
	echo "2) Install Plugins"
	echo "3) Install Binaries"
	echo "4) Install Linters"
	echo "5) Exit"
	echo "========================================="
	read -p "Enter your choice (1-5): " choice
	case "$choice" in
		1) install_configurations ;;
		2) install_plugins        ;;
		3) install_binaries       ;;
		4) install_linters        ;;
		5) echo "exiting..."; exit 0                   ;;
	esac
}

# Function to install configurations
install_configurations() {
if [ -d $CONFIG_DIR ]; then
	for config in $(ls -A $CONFIG_DIR | grep '^\.'); do
			config_path="$CONFIG_DIR/$config"
		if [ -f "$config_path" ]; then
			echo "Symlinking config: $config_name"
			setup_symlink "$config_path" "$TARGET_HOME/$config"
		fi
	done
		echo "Configurations installed"
else 
	echo "Warning: Configurations directory $CONFIG_DIR not found"
fi
}

install_plugins(){
echo "Setting up plugins..."
mkdir -p "$TARGET_HOME/.vim/pack/plugins/start"
if [ -d "$PLUGINS_DIR" ]; then
	for plugin in "$PLUGINS_DIR"/*; do
		if [ -e "$plugin" ]; then
			plugin_name=$(basename "$plugin")
			echo "Symlinking plugin: $plugin_name"
			setup_symlink "$plugin" "$TARGET_HOME/.vim/pack/plugins/start/$plugin_name"
		fi
	done
	echo "Plugins installed"
else
	echo "Warning: Plugins directory $PLUGIN_DIR not found"
fi
}

install_binaries(){
echo "Adding binaries to $PATH"
mkdir -p "$TARGET_HOME/bin"
if [ -d "$BIN_DIR" ]; then
	for script in "$BIN_DIR"/*; do
		if [ -e "$script" ]; then
			script_name=$(basename "$script")
			echo "Linking binaries: $script_name"
			setup_symlink "$script" "$TARGET_HOME/bin/$script_name"
		fi
	done
else
	echo "Warning:  Bin directory $BIN_DIR does not exist"
fi
}

install_linters(){
echo "Adding linters..."
#Add function logic
echo "Linters installed"
}

setup_symlink(){
	src="$1"
	dest="$2"
	if [ -e "$src" ]; then
		if [ -e "$dest" ]; then
			echo "Warning: $(basename $dest) already exist! Skipping..."
		else
			echo "Creating symlink. $(basename $dest) -> $(basename $src) "
			ln -sf "$src" "$dest"
		fi
	else
		echo "Warning: $(basename $src) not found"
	fi
}

# Main setup logic
if [ -d "/mnt" ]; then
	echo "Setting up ish..."
	CONFIG_DIR="/mnt/sharedlocal/myconfigs/configs"
	TARGET_HOME="$HOME"
else
	echo "Setting up a-Shell..."
	CONFIG_DIR=$(showmarks group | awk '{print $2}')/myconfigs/configs
	TARGET_HOME="$HOME/Documents"
fi

PLUGINS_DIR="$CONFIG_DIR/.vim/pack/plugins/start"
BIN_DIR="$CONFIG_DIR/bin"

echo "CONFIG_DIR: $CONFIG_DIR"
echo "TARGET_HOME: $TARGET_HOME"
echo "PLUGINS_DIR: $PLUGINS_DIR"
echo "BIN_DIR: $BIN_DIR"

#show the menu
while true; do
	show_menu
done
