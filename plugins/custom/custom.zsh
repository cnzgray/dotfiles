

#########################
# Alias Config
#########################
# alias vi="vim"
alias zshconfig="cot ~/.zshrc"
alias lsregister="/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Versions/A/Support/lsregister"

# 正rsync同步时候的默认权限为777的问题
# alias rsync="rsync --chmod=Du=rwx,Dgo=rx,Fu=rw,Fog=r --no-o --no-g"

# brew alias
alias bubo='brew update && brew outdated'
alias bubc='brew upgrade && brew cleanup'
alias bubu='bubo && bubc'

# docker相关alias
#alias dps="docker ps -q | xargs docker inspect --format '{{ .Name }} - {{ .NetworkSettings.IPAddress }}'"
alias dps='docker ps --format "table {{.ID}}\t{{.Image}}\t{{.Status}}\t{{.Names}}"'
alias dbl='docker build'
alias dcin='docker container inspect'
alias dcls='docker container ls'
alias dclsa='docker container ls -a'
alias dib='docker image build'
alias dii='docker image inspect'
alias dils='docker image ls'
alias dipu='docker image push'
alias dirm='docker image rm'
alias dit='docker image tag'
alias dlo='docker container logs'
alias dnc='docker network create'
alias dncn='docker network connect'
alias dndcn='docker network disconnect'
alias dni='docker network inspect'
alias dnls='docker network ls'
alias dnrm='docker network rm'
alias dpo='docker container port'
alias dpu='docker pull'
alias dr='docker container run'
alias drit='docker container run -it'
alias drm='docker container rm'
alias 'drm!'='docker container rm -f'
alias dst='docker container start'
alias drs='docker container restart'
alias dsta='docker stop $(docker ps -q)'
alias dstp='docker container stop'
alias dtop='docker top'
alias dvi='docker volume inspect'
alias dvls='docker volume ls'
alias dvprune='docker volume prune'
alias dxc='docker container exec'
alias dxcit='docker container exec -it'

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
alias ports="lsof -Pni | grep LISTEN"
alias dnsflush="sudo killall -HUP mDNSResponder"

#########################
# Custom Function Config
#########################

# belongs to port
# usage: "port 8000"
function port() { lsof -i tcp:$1 | grep LISTEN }

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

