#!/usr/bin/env zsh

# homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/opt/homebrew/bin/brew shellenv)"

# homebrew packages
brew update
brew install git tmux fnm wget jq ripgrep fd fzf mariadb
brew install --verbose --HEAD neovim
brew install --cask firefox keepassxc ghostty
brew services start mariadb

# link configs
mkdir -p ~/.config/nvim && ln -sf ~/dot/init.lua ~/.config/nvim/init.lua
mkdir -p ~/.config/tmux && ln -sf ~/dot/tmux.conf ~/.config/tmux/tmux.conf
mkdir -p ~/.config/ghostty && ln -sf ~/dot/config ~/.config/ghostty/config
ln -sf ~/dot/.zshrc ~/.zshrc

# setup fnm & nodejs
eval "$(fnm env --use-on-cd --shell zsh)"
fnm use lts-latest --install-if-missing
fnm default lts-latest

# npm packages
npm i -g npm@latest
npm i -g typescript typescript-language-server vscode-langservers-extracted
npm i -g http-server prettier @johnnymorganz/stylua-bin tree-sitter-cli

# git
git config --global user.name "flipkiw"
git config --global user.email "257479979+flipkiw@users.noreply.github.com"
ssh-keygen -t ed25519 -C "257479979+flipkiw@users.noreply.github.com" -f ~/.ssh/id_ed25519
