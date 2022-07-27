DEFAULT_USER=$(whoami)
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="/usr/local/sbin:$PATH"


# 初始化zpm
if [[ ! -f ~/.zpm/zpm.zsh ]]; then
  git clone --recursive https://github.com/zpm-zsh/zpm ~/.zpm
fi
source ~/.zpm/zpm.zsh

# Pull in OMZ (doesn't actually source anything)
zpm load @omz
# Load any OMZ libraries we want or our OMZ plugins require
zpm load @omz/lib/clipboard
zpm load @omz/lib/compfix
zpm load @omz/lib/completion
zpm load @omz/lib/directories
zpm load @omz/lib/functions
zpm load @omz/lib/git
zpm load @omz/lib/grep
zpm load @omz/lib/history
zpm load @omz/lib/key-bindings
zpm load @omz/lib/misc
zpm load @omz/lib/spectrum
zpm load @omz/lib/termsupport
zpm load @omz/lib/theme-and-appearance

# Load some OMZ theme
zpm load @omz/theme/robbyrussell
# zpm load @omz/theme/agnoster

# Load some OMZ plugins
zpm load @omz/virtualenv
zpm load @omz/gitfast
zpm load @omz/git
zpm load @omz/git-flow-avh
# zpm load @omz/tmux
zpm load @omz/docker
zpm load @omz/docker-compose
zpm load @omz/command-not-found
zpm load @omz/extract
zpm load @omz/colored-man-pages
zpm load @omz/man
zpm load @omz/rsync

# 添加额外的命令自动完成
zpm load @gh/zsh-users/zsh-completions
# 历史搜索插件, Ctrl+R激活
zpm load @gh/zdharma-continuum/history-search-multi-word
# 类似fish的自动提示
zpm load @gh/zsh-users/zsh-autosuggestions
# 语法高亮
zpm load @gh/zdharma-continuum/fast-syntax-highlighting
# 类似fish的上下键搜索历史, 上下方向键激活
zpm load @gh/zsh-users/zsh-history-substring-search
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down


# # nvm
# export NVM_LAZY_LOAD=true
# export NVM_AUTO_USE=true
# zinit light lukechilds/zsh-nvm
# alias upgrade_nodejs="nvm install node --reinstall-packages-from=node && nvm alias default node"

# # nvs初始化
# export NVS_HOME="$HOME/.nvs"
# [ -s "$NVS_HOME/nvs.sh" ] && . "$NVS_HOME/nvs.sh"
# # nvs auto on
# # 在切换目录的时候检测nvmrc并自动use
# autoload -U add-zsh-hook
# load-nvmrc() {
#   if [[ -f .nvmrc && -r .nvmrc ]]; then
#     nvs use auto
#   fi
# }
# add-zsh-hook chpwd load-nvmrc
# load-nvmrc
# alias upgrade_nodejs="nvs upgrade latest"


#########################
# Alias Config
#########################

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

# ssh
alias ssh-nocheck='ssh -o StrictHostKeyChecking=no'

# ports
alias ports='lsof -Pni | grep LISTEN'
function port() { lsof -i tcp:$1 | grep LISTEN }
