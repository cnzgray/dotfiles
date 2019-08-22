# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
DEFAULT_USER=$(whoami)

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"
#ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM="$HOME/.dotfiles/ohmyzsh/custom"

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    docker
    docker-compose
    zsh-syntax-highlighting
    zsh-autosuggestions
    zsh-completions
    zsh-nvm
    yarn
)
autoload -U compinit && compinit # 配合zsh-completions插件

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

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
