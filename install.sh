#!/bin/sh

[ "${SHELL##/*/}" != "zsh" ] && echo 'You might need to change default shell to zsh: `chsh -s /bin/zsh`'

echo "clone dotfiles..."
dir="$HOME/.dotfiles"
if [ ! -d "$dir" ]; then
    mkdir -p $dir
    git clone --recursive https://github.com/cnzgray/dotfiles.git $dir
fi

#echo "install antigen..."
#curl -L git.io/antigen > "$dir/antigen.zsh"

cd "$dir"

sh etc/symlink-dotfiles.sh

if [ `uname` = 'Darwin' ]; then
  sh etc/symlink-macos.sh
fi
