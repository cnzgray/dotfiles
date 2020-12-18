DEFAULT_USER=$(whoami)
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="/usr/local/sbin:$PATH"

ANTIGEN_PATH=~/.dotfiles
source $ANTIGEN_PATH/antigen/antigen.zsh
# Load the oh-my-zsh's library.
antigen use oh-my-zsh
# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle tmux
antigen bundle docker
antigen bundle docker-machine
antigen bundle docker-compose
antigen bundle command-not-found

antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions

# NVM_LAZY_LOAD=true
antigen bundle lukechilds/zsh-nvm

# Load the theme.
# antigen theme robbyrussell
# antigen theme agnoster
# 使用dracula主题
antigen theme dracula/zsh

# Tell Antigen that you're done.
antigen apply

# 修复dracula主题导致ohmyzsh的按键绑定配置失效的问题
if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
  function zle-line-init() {
    echoti smkx
  }
  function zle-line-finish() {
    echoti rmkx
  }
  zle -N zle-line-init
  zle -N zle-line-finish
fi

#########################
# Alias Config
#########################

alias zshconfig="cot ~/.zshrc"
alias ohmyzsh="cot ~/.oh-my-zsh"
alias lsregister="/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Versions/A/Support/lsregister"

# 正rsync同步时候的默认权限为777的问题
alias rsync="rsync --chmod=Du=rwx,Dgo=rx,Fu=rw,Fog=r --no-o --no-g"

# brew alias
alias bubo='brew update && brew outdated'
alias bubc='brew upgrade && brew cleanup'
alias bubu='bubo && bubc'

# docker相关alias
#alias dps="docker ps -q | xargs docker inspect --format '{{ .Name }} - {{ .NetworkSettings.IPAddress }}'"
alias dps='docker ps --format "table {{.ID}}\t{{.Image}}\t{{.Status}}\t{{.Names}}"'

## git相关
# 删除已经被忽略的文件
alias git_rm_ignored='git ls-files -i --exclude-from=.gitignore | xargs git rm --cached'
alias gita_fetch_all="find . -name .git -type d -exec git --git-dir '{}' fetch --all ';'"
alias gita_clean="find . -name .git -type d -exec git --git-dir '{}' clean -df -X ';'"

# users && groups
alias lsusers="cut -d: -f1 /etc/passwd"
alias lsgroups="cut -d: -f1 /etc/group"

# dig alias
alias dig@google="dig @8.8.8.8"
alias dig@dnspod="dig @119.29.29.29"
alias dig@aliyun="dig @223.5.5.5"

#
alias ssh-nocheck='ssh -o StrictHostKeyChecking=no'


#########################
# Custom Function Config
#########################

# belongs to port
# usage: "port 8000"
function port() { lsof -i tcp:$1 | grep LISTEN }
# all open ports
# usage: "ports"
function ports() { lsof -Pni | grep LISTEN }

function forward80 {
    # sudo pfctl -ef /etc/pf-forward80.conf
    echo -e "\nrdr pass inet proto tcp from any to any port 80 -> 127.0.0.1 port 8080\n"|\
    sudo pfctl -ef - &&\
    echo "forward 80 to 8080 enable."
}

function unforward80() {
    # sudo pfctl -df /etc/pf-forward80.conf
    echo -e "\nrdr pass inet proto tcp from any to any port 80 -> 127.0.0.1 port 8080\n"|\
    sudo pfctl -df - &&\
    echo "forward 80 to 8080 disable."
}

function enable_proxy {
    export {http,https,ftp}_proxy="http://127.0.0.1:1087" \
        && echo set proxy: $http_proxy
}

function disable_proxy {
    unset {http,https,ftp}_proxy \
        && echo unset {http,https,ftp}_proxy
}
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
