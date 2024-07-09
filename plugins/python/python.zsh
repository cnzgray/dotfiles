# 在切换目录的时候检测python的venv并自动active
load-python-venv() {
  local name="${1:-venv}"
  local venvpath="${name:P}"

  if [[ -d "$venvpath" && -f "${venvpath}/bin/activate" ]]; then
    . "${venvpath}/bin/activate" || return $?
    echo "Activated virtual environment ${name}"
  fi
}
autoload -U add-zsh-hook
add-zsh-hook chpwd load-python-venv
load-python-venv
