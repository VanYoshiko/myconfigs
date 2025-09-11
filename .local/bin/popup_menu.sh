pmenu

" List if configurations
function! InstalL_Config_Popup()
	let configs=['.bashrc', '.gitconfig', '.gitignore', '.profile', '.vimrc', '.ssh']
" Create a popup menu
	let choices=popup_create(configs, {
		\ 'Title':'Select Configurations to Install',
		\ 'border':[1, 1, 1],
		\ 'padding':[1, 1, 1],
		\ 'pos':'center',
		\ 'filter':'popup_filter_menu',
		\ 'callback':'InstallConfigCallback',
		\})
endfunction

" Callback function for the popup menu
function! InstallConfigCallback(id, result)
	if a:result == -1
		echo "Installation canceled"
		return
	endif

" Get the selected configuration
let configs = ['.bashrc', '.gitconfig', '.gitignore', '.profile', '.vimrc', '.ssh']
let selected_config = configs[a:result - 1]
echo "Installing " . selected_config . "..."
endfunction
call InstallConfigPopup()
