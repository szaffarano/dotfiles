set -x EDITOR nvim
set -x RUST_VERSION (asdf current rust | cut -d" " -f 1)
set -x PYTHON_VERSION (asdf current python | awk '{print $1}')

append-to-path ~/.local/bin
append-to-path ~/projects/git-toolbelt/

set -q RUST_VERSION; \
  and append-to-path ~/.asdf/installs/rust/$RUST_VERSION/bin

set -q PYTHON_VERSION; \
  and append-to-path ~/.asdf/installs/python/$PYTHON_VERSION/bin

# Java versions, run:
#   /usr/libexec/java_home -V 2>&1  | grep "^\s.*" | sed -E s'/\ +(.*),.*/\1/g' | sort -u

set JAVA7_VERSION        1.7.0_242-zulu-7.34.0.5
set JAVA8_ORACLE_VERSION 1.8.0_231
set JAVA8_VERSION        1.8.0_242
set JAVA11_VERSION       11.0.2
set JAVA13_VERSION       13.0.2

set -x FZF_DEFAULT_OPTS
set FZF_DEFAULT_OPTS --layout=reverse
set -a FZF_DEFAULT_OPTS --info=inline
set -a FZF_DEFAULT_OPTS --height=80%
set -a FZF_DEFAULT_OPTS --multi
set -a FZF_DEFAULT_OPTS --preview-window=:hidden
set -a FZF_DEFAULT_OPTS --prompt='∼ ' --pointer='▶' --marker='✓'
set -a FZF_DEFAULT_OPTS --bind "'?:toggle-preview'"
set -a FZF_DEFAULT_OPTS --bind "'ctrl-a:select-all'"
set -a FZF_DEFAULT_OPTS --bind "'ctrl-e:execute(echo {+} | xargs -o vim)'"
set -a FZF_DEFAULT_OPTS --bind "'ctrl-v:execute(code {+})'"
set -a FZF_DEFAULT_OPTS --preview \
  "'begin [ -f {} ]; and bat --style=numbers --color=always {}; or cat {}; end; \
  or begin [ -d {} ]; and tree -C {} | less; or echo {} 2> /dev/null | head -200; end'"

switch (uname)
    case Linux
      set -a FZF_DEFAULT_OPTS --bind '"ctrl-y:execute-silent(echo {+} | xclip -in -selection clipboard)"'
    case Darwin
      set -a FZF_DEFAULT_OPTS --bind '"ctrl-y:execute-silent(echo {+} | pbcopy)"'
end


