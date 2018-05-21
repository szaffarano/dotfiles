# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

NVM_NO_USE="true"

ZSH_THEME="steeef"

plugins=(git colorize github yum docker systemd) 
plugins+=(zsh-nvm)

export EDITOR=vim

export GOPATH=$HOME/projects/go

export PATH="/usr/local/bin"
export PATH="$PATH:/usr/bin"
export PATH="$PATH:/usr/local/go/bin"
export PATH="$PATH:/bin"
export PATH="$PATH:/usr/local/sbin"
export PATH="$PATH:/usr/sbin"
export PATH="$PATH:/home/sebas/.dotfiles/bin"
export PATH="$PATH:/home/sebas/.yarn/bin"
export PATH="/home/sebas/.local/anaconda3/bin:$PATH"
export PATH="$PATH:$GOPATH/bin"

export GPG_TTY=`tty` 

export MOZILLA_FIVE_HOME=/usr/lib/mozilla

#
# Avoids gtk3 warnings (https://bbs.archlinux.org/viewtopic.php?id=176663)
#
export NO_AT_BRIDGE=1

source $ZSH/oh-my-zsh.sh

zstyle ':completion:*' special-dirs true

fpath=(~/.zsh/completion $fpath)
autoload -Uz compinit && compinit -i

#
# Local configs
#
if [ -f ~/.zshrc_local ]; then
    source ~/.zshrc_local
fi

#
# NVM config
#
[[ -r $NVM_DIR/bash_completion ]] && . $NVM_DIR/bash_completion

#
# base16 config
#
BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && \
  eval "$($BASE16_SHELL/profile_helper.sh)"
base16_atelier-forest

# gitignore.io
function gi() { curl -L -s https://www.gitignore.io/api/$@ ;}

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/sebas/.sdkman"
[[ -s "/home/sebas/.sdkman/bin/sdkman-init.sh" ]] && \
  source "/home/sebas/.sdkman/bin/sdkman-init.sh"
