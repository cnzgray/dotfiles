# nvs初始化
export NVS_HOME="$HOME/.nvs"
if [[ ! -f "$HOME/.nvs/nvs.sh" ]]; then
  git clone https://github.com/jasongin/nvs "$NVS_HOME"
fi
[ -s "$NVS_HOME/nvs.sh" ] && source "$NVS_HOME/nvs.sh"
# 在切换目录的时候检测nvmrc并自动use
load-nvmrc() {
  if [[ -f .nvmrc && -r .nvmrc ]]; then
    nvs use auto
  fi
}
autoload -U add-zsh-hook
add-zsh-hook chpwd load-nvmrc
load-nvmrc
alias upgrade_nodejs="nvs upgrade latest"
