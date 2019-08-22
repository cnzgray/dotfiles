#!/bin/sh

[ "${SHELL##/*/}" != "zsh" ] && echo 'You might need to change default shell to zsh: `chsh -s /bin/zsh`'

echo " ********************************************************"
echo " ************ INFO: install oh-my-zsh *******************"
echo " ********************************************************"

# install ohmyzsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo " ********************************************************"
echo " ************ INFO: install dotfiles  *******************"
echo " ********************************************************"
dir="$HOME/.dotfiles"
mkdir -p $dir
if [ ! -d "$dir" ]; then
    git clone --recursive https://github.com/cnzgray/dotfiles.git $dir
fi

# install zsh plugins
ZSH_CUSTOM="$HOME/.dotfiles/ohmyzsh/custom"
mkdir -p $ZSH_CUSTOM
if [ ! -d "${ZSH_CUSTOM}/plugins/zsh-autosuggestions" ]; then
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM}/plugins/zsh-autosuggestions
fi

if [ ! -d "${ZSH_CUSTOM}/plugins/zsh-syntax-highlighting" ]; then
  git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM}/plugins/zsh-syntax-highlighting
fi

if [ ! -d "${ZSH_CUSTOM}/plugins/zsh-completions" ]; then
  git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM}/plugins/zsh-completions
fi

if [ ! -d "${ZSH_CUSTOM}/plugins/zsh-nvm" ]; then
  git clone https://github.com/lukechilds/zsh-nvm ${ZSH_CUSTOM}/plugins/zsh-nvm
fi

cd $dir
sh etc/symlink-dotfiles.sh
