# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

NVM_NO_USE="true"

ZSH_THEME="steeef"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

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
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git colorize github yum docker systemd) 
plugins+=(zsh-nvm)

# User configuration

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

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

export EDITOR=vim

export GOPATH=$HOME/projects/go

export PATH="/usr/local/bin"
export PATH="$PATH:/usr/bin"
export PATH="$PATH:/usr/local/go/bin"
export PATH="$PATH:/bin"
export PATH="$PATH:/usr/local/sbin"
export PATH="$PATH:/usr/sbin"
export PATH="$PATH:/home/sebas/.bin"
export PATH="$PATH:/home/sebas/.yarn/bin"
export PATH="/home/sebas/.local/anaconda3/bin:$PATH"
export PATH="$PATH:$GOPATH/bin"

source $ZSH/oh-my-zsh.sh

zstyle ':completion:*' special-dirs true

fpath=(~/.zsh/completion $fpath)
autoload -Uz compinit && compinit -i

export GPG_TTY=`tty` 

export MOZILLA_FIVE_HOME=/usr/lib/mozilla

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

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/sebas/.sdkman"
[[ -s "/home/sebas/.sdkman/bin/sdkman-init.sh" ]] && \
  source "/home/sebas/.sdkman/bin/sdkman-init.sh"
function gi() { curl -L -s https://www.gitignore.io/api/$@ ;}
