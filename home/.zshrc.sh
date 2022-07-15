# 初始化zinit
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}}/.zinit/zinit.git"
if [[ ! -f "${ZINIT_HOME}/zinit.zsh" ]]; then
  git clone https://github.com/zdharma-continuum/zinit.git "${ZINIT_HOME}"
fi
source "${ZINIT_HOME}/zinit.zsh"

DEFAULT_USER=$(whoami)
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:$PATH"

# omz libs
zinit snippet OMZL::clipboard.zsh
zinit snippet OMZL::completion.zsh
zinit snippet OMZL::directories.zsh
zinit snippet OMZL::history.zsh
zinit snippet OMZL::git.zsh
zinit snippet OMZL::key-bindings.zsh
zinit snippet OMZL::termsupport.zsh
zinit snippet OMZL::theme-and-appearance.zsh

# omz 主题
# zinit snippet OMZT::robbyrussell
# zinit snippet OMZT::agnoster
# dracula主题
zinit light dracula/zsh
# zinit for depth=1 light-mode romkatv/powerlevel10k

# omz git plugin
zinit snippet OMZP::git

# omz git-flow plugin
zinit snippet OMZP::git-flow-avh

# omz tmux plugin
#zinit snippet OMZP::tmux

# omz dotenv plugin
# zinit snippet OMZP::dotenv

# omz docker plugin
zinit for \
  as"completion" OMZP::docker/_docker

# omz docker-machine plugin
zinit for \
  as"completion" OMZP::docker-machine/_docker-machine \
  OMZP::docker-machine \

# omz docker-compose plugin
zinit for \
  as"completion" OMZP::docker-compose/_docker-compose \
  OMZP::docker-compose

# omz command-not-found plugin
zinit snippet OMZP::command-not-found

# omz extract plugin
zinit for \
  as"completion" OMZP::extract/_extract \
  OMZP::extract

# omz colored-man-pages plugin
zinit snippet OMZP::colored-man-pages

# omz man plugin
zinit snippet OMZP::man

# omz rsync plugin
zinit snippet OMZP::rsync

# # 

# 延迟加载以下插件
#   历史搜索插件
#   语法高亮
#   命令完成
#   类似fish的自动提示
#   类似fish的上下键搜索历史
zinit wait lucid for \
  light-mode \
    zdharma-continuum/history-search-multi-word \
  light-mode blockf \
    zsh-users/zsh-completions \
  light-mode atload"!_zsh_autosuggest_start" \
    zsh-users/zsh-autosuggestions \
  light-mode atload'bindkey "$terminfo[kcuu1]" history-substring-search-up; bindkey "$terminfo[kcud1]" history-substring-search-down' \
    zsh-users/zsh-history-substring-search \
  light-mode atinit"ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay" \
    zdharma-continuum/fast-syntax-highlighting \

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

