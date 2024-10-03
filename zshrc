# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH


if [ -z "${WAYLAND_DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
    exec Hyprland
fi

export ZSH=$HOME/.oh-my-zsh
export PATH="$HOME/tools/node-v14.15.4-linux-x64/bin:$PATH"

export PATH="$PATH:/home/elias/.pyEnv/:"

ZSH_THEME="robbyrussell"

plugins=(git virtualenv)

alias yay= paru

source $ZSH/oh-my-zsh.sh
source ~/alien/alien.zsh
export ALIEN_THEME="blue"
source ~/.pyEnv/bin/activate

#Aliases
alias ..='cd ..'
alias ls='exa -l -F --icons --hyperlink'

alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias ip='ip --color=auto'

alias lock='swaylock'
alias standby='systemctl suspend'

# Loading ZSH modules
autoload -Uz compinit
autoload -Uz vcs_info # Git

enablevpn() {
  echo To enable the VPN, you need a password, please run on every reboot
  echo Your network speed will be decreased but you will be connected to the
  echo home network
  sudo systemctl start wg-quick@wg0
}

disablevpn() {
  echo Disabling the vpn will require you to reconnect to the network with
  echo nmcli, please enter a password or cancel.
  sudo systemctl stop wg-quick@wg0
}


export ALIEN_SECTIONS_LEFT=(
  exit
  user
  path
  vcs_branch:async
  vcs_status:async
  vcs_dirty:async
  newline
  ssh
  venv
  prompt
)


export ALIEN_SECTIONS_RIGHT=(
  time
  battery
)


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
