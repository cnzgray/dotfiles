#
# Modules
#

# Sets sane Zsh built-in environment options.
zmodule environment
# Provides handy git aliases and functions.
zmodule git
# Applies correct bindkeys for input events.
zmodule input
# Sets a custom terminal title.
zmodule termtitle
# Utility aliases and functions. Adds colour to ls, grep and less.
zmodule utility

# 自定义模块
MY_DOTFILES_HOME=${HOME}/.dotfiles
zmodule $MY_DOTFILES_HOME/plugins/docker
# zmodule $MY_DOTFILES_HOME/plugins/nvs
# zmodule $MY_DOTFILES_HOME/plugins/pyenv
zmodule $MY_DOTFILES_HOME/plugins/python
# zmodule $MY_DOTFILES_HOME/plugins/java
# zmodule $MY_DOTFILES_HOME/plugins/custom
# My custom completions
zmodule $MY_DOTFILES_HOME --fpath functions

# ohmyzsh plugins
zmodule ohmyzsh/ohmyzsh --root plugins/rsync
zmodule ohmyzsh/ohmyzsh --root plugins/pyenv
zmodule ohmyzsh/ohmyzsh --root plugins/python
# pnpm命令自动完成
zmodule baliestri/pnpm.plugin.zsh --source "pnpm.plugin.zsh" --fpath ""
# dotnet cli
zmodule memark/zsh-dotnet-completion

#
# Prompt
#

# Exposes to prompts how long the last command took to execute, used by asciiship.
zmodule duration-info
# Exposes git repository status information to prompts, used by asciiship.
zmodule git-info
# A heavily reduced, ASCII-only version of the Spaceship and Starship prompts.
zmodule asciiship

#
# Completion
#
skip_global_compinit=1
# Additional completion definitions for Zsh.
zmodule zsh-users/zsh-completions --fpath src
# Enables and configures smart and extensive tab completion.
# completion must be sourced after all modules that add completion definitions.
zmodule completion

#
# Modules that must be initialized last
#

# Fish-like syntax highlighting for Zsh.
# zsh-users/zsh-syntax-highlighting must be sourced after completion
zmodule zsh-users/zsh-syntax-highlighting
# Fish-like history search (up arrow) for Zsh.
# zsh-users/zsh-history-substring-search must be sourced after zsh-users/zsh-syntax-highlighting
zmodule zsh-users/zsh-history-substring-search
# Fish-like autosuggestions for Zsh.
zmodule zsh-users/zsh-autosuggestions
