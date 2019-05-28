#!/bin/sh

[ "${SHELL##/*/}" != "zsh" ] && echo 'You might need to change default shell to zsh: `chsh -s /bin/zsh`'

echo " ********************************************************"
echo " ************ INFO: install oh-my-zsh *******************"
echo " ********************************************************"

# install ohmyzsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
# install zsh plugins
ZSH_CUSTOM="$HOME/.dotfiles/ohmyzsh/custom"
mkdir -p $ZSH_CUSTOM
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM}/plugins/zsh-completions

echo " ********************************************************"
echo " ************ INFO: install dotfiles  *******************"
echo " ********************************************************"
dir="$HOME/.dotfiles"
mkdir -p $dir
git clone --recursive https://github.com/cnzgray/dotfiles.git $dir
cd $dir

sh etc/symlink-dotfiles.sh
