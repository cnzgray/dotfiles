# 检查docker命令是否存在，不存在则不执行
if ! command -v docker &> /dev/null; then
    return
fi

MY_DOTFILES_HOME=${HOME}/.dotfiles
if [[ ! -f "$MY_DOTFILES_HOME/functions/_docker" ]]; then
    mkdir -p "$MY_DOTFILES_HOME/functions"
    docker completion zsh > "$MY_DOTFILES_HOME/functions/_docker"
    chmod +x "$MY_DOTFILES_HOME/functions/_docker"
    echo "写入docker completion成功."
fi
