export EDITOR=nvim
export LANG="en_US.UTF-8"

export GOPATH=$HOME/projects/go

export PYTHON_VERSION=$(asdf current python | awk '{print $2}')

PATH="$HOME/.bin:$PATH"
PATH="$HOME/.local/bin:$PATH"
PATH="/usr/local/bin:$PATH"
PATH="$GOPATH/bin:$PATH"
PATH="$HOME/.asdf/installs/python/$PYTHON_VERSION/bin:$PATH"
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

