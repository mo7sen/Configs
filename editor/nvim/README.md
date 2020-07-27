# ...Still under construction

### Plugin Manager Used:
`junegunn/vim-plug`: I just like how easy it is to just add new plugins (and even set custom option for each one).

### Installation Steps:
WARNING: The following shell commands assume that the vim config file is located at `~/.config/nvim`.
```
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
The init.vim file tells vim-plug to store the plugins in a folder called "plugs". I'm not entirely sure on whether vim-plug creates the directory on its own, so just to be safe:
```
mkdir ~/.config/nvim/plugs
```

### Plugins Used:

- `sheerun/vim-polyglot`: A plugin that is just a wrapper for 150+ other plugins that support multiple filetypes and languages. This is just me being too lazy to use a separate plugin for every language/filetype that I use. To be honest though, I didn't experience any performance losses (lazy me and performance-freak me are shaking hands right now).

- `ayu-theme/ayu-vim`: This is my favorite colorscheme for anything and it'll probably appear in a lot of configs in this repository. (It should be illegal for a colorscheme to look this good :D)

- `itchyny/lightline.vim`: A statusline plugin. I used to use `vim-airline/vim-airline` but lightline is way more lightweight (obviously) and takes a lot less time at startup.

- `tpope/vim-vinegar`: A file explorer plugin that is just a wrapper tpope made over vim's netrw to try making it more intuitive. I recently started using it as I got tired of how much `preservim/nerdtree` slows down the startup of neovim.

- `tpope/vim-surround`: A plugin that gives keybindings to easily surround text with whatever (brackets, curly braces, etc..). Pretty much a necessity once you start using it.

- `tpope/vim-commentary`: A plugin that gives the keybinding `gc` for commenting lines. Useful as I'm too lazy to comment using visual block selection.

- `tommcdo/vim-lion`: A plugin that gives keybindings to align several lines with respect to a specific character. I don't even know how I survived before knowing about this.

- `easymotion/vim-easymotion`: Basically vim's movement commands but on steroids.

- `tpope/vim-obsession`: A plugin that can automatically create and update `Session.vim` files to make vim sessions more usable.


