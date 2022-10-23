export TERMINAL=kitty
export EDITOR=nvim
export LANG="en_US.UTF-8"

export GOPATH=$HOME/projects/go

export AWS_CLI_AUTO_PROMPT=on-partial
export AWS_VAULT_BACKEND=pass

PATH="$HOME/.asdf/bin:$PATH"
PATH="$HOME/.asdf/shims:$PATH"
PATH="$HOME/.bin:$PATH"
PATH="$HOME/.local/bin:$PATH"
PATH="/usr/local/bin:$PATH"
PATH="$GOPATH/bin:$PATH"
PATH="$HOME/.tfenv/bin:$PATH"
PATH="$HOME/.krew/bin:$PATH"
export PATH

if [[ "$OSTYPE" == "linux-gnu" ]]; then
  CLIPBOARD="xclip -in -selection clipboard"
elif [[ "$OSTYPE" == "darwin"* ]]; then
  CLIPBOARD="pbcopy"
fi
export CLIPBOARD

if which bat >/dev/null 2>&1; then
  CAT="bat"
elif which batcat >/dev/null 2>&1; then
  CAT="batcat"
else
  cat="cat"
fi

export FZF_DEFAULT_COMMAND='fd --type f'

FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS --layout=reverse"
FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS --info=inline"
FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS --height=80%"
FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS --multi"
FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS --preview-window=:hidden"
FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS --preview '([[ -f {} ]] && ($CAT --style=numbers --color=always {} || cat {})) || ([[ -d {} ]] && (tree -C {} | less)) || echo {} 2> /dev/null | head -200'"
FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS --color='hl:148,hl+:154,pointer:032,marker:010,bg+:237,gutter:008'"
FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS --prompt='∼ ' --pointer='▶' --marker='✓'"
FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS --bind '?:toggle-preview'"
FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS --bind 'ctrl-a:select-all'"
FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS --bind 'ctrl-y:execute-silent(echo {+} | $CLIPBOARD)'"
FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS --bind 'ctrl-e:execute(echo {+} | xargs -o $EDITOR)'"
export FZF_DEFAULT_OPTS

# OS specific environment
case $(uname) in
  Linux)
    export MESA_LOADER_DRIVER_OVERRIDE=i965
    export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

    PATH="$HOME/projects/git-toolbelt:$PATH"
    export PATH
    ;;
  Darwin)
    export PKG_CONFIG_PATH="/usr/local/opt/icu4c/lib/pkgconfig"
    ;;
esac

export GOPASS_CLIPBOARD_COPY_CMD="gopass-copy"

nnnPlugins=(
  'f:finder'
  'o:fzopen'
  'd:diffs'
  't:nmount'
  'p:preview-tui'
  'r:renamer'
)

nnnBookmarks=(
  'd:~/.dotfiles'
  'p:~/projects'
  'i:~/Pictures'
  'D:~/Documents'
)

if [ -z "$NNN_BMS" ]; then
  for b in $nnnBookmarks; do
    if [ -z $NNN_BMS ]; then
      NNN_BMS="$b"
    else
      NNN_BMS="$b;$NNN_BMS"
    fi
  done
fi

if [ -z "$NNN_PLUG" ]; then
  for p in $nnnPlugins; do
    if [ -z $NNN_PLUG ]; then
      NNN_PLUG="$p"
    else
      NNN_PLUG="$p;$NNN_PLUG"
    fi
  done
fi

export NNN_PLUG
export NNN_BMS
export NNN_FIFO=/tmp/nnn.fifo

export TFENV_AUTO_INSTALL=true

export RIPGREP_CONFIG_PATH="$HOME/.config/ripgrep/ripgreprc"
