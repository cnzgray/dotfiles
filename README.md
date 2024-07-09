# Useage

```sh
curl -L https://raw.githubusercontent.com/cnzgray/dotfiles/master/install.sh | sh
```

# Dropbox

```
rm -rf $HOME/.dotfiles
ln -s $HOME/Dropbox/dotfiles $HOME/.dotfiles
cd $HOME/.dotfiles && source etc/symlink-dotfiles.sh
```

# Develop

```
docker build . -t zgray/ubuntu-zsh:latest
docker run --rm -it -v $PWD:/root/.dotfiles zgray/ubuntu-zsh zsh
$HOME/.dotfiles/install.sh
# 删除开发镜像
docker image rm zgray/ubuntu-zsh:latest
```

