#!/bin/bash

[ -e "$HOME"/.asdf ] \
    || git clone https://github.com/asdf-vm/asdf.git "$HOME"/.asdf \
    && cd "$HOME"/.asdf \
    && git checkout "$(git describe --abbrev=0 --tags)"


# shellcheck disable=SC1090
source "$HOME"/.asdf/asdf.sh

# shellcheck disable=SC1090
source "$HOME"/.asdf/completions/asdf.bash

asdf update --head

