# Setup

- Download the files
- Extract package to `~/.config/`
- Open your terminal
- run `tmux`
- `CTRL + S, I` to download the tmux theme
- `CTRL + S, r` to reload the tmux config 

# Starship

Don't have / know Starship? [Check it out](https://starship.rs/)

# Helix: Language Servers

For the helix configuration to correctly use language servers and formatters, you'll need to install the following language servers globally.

- vscode-langservers-extracted 
- typescript-language-server
- gopls
- emmet-ls
- prettier
- tailwindcss-language-server 

# Helix: Bindings

A few custom keybindings are configured:

- CTRL+J  : move current selection down.
- CTRL+K  : move current selection up.
- G       : go to end of file
- ESC     : collapse the selection and return to single space selection
- SPACE-q : quit
- SPACE-w : write
