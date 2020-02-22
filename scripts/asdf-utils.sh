source $HOME/.asdf/asdf.sh

if ! $(which asdf 2> /dev/null 1>&2); then
    echo "asdf not found!"
    exit 1
fi

function installOrUpdateAsdfPlugin {
    checkAsdfSetup

    asdf plugin-add $1 || asdf plugin-update $1
}

function installAsdfPackage {
    PKG=$1
    VERSION=$2

    asdf install $PKG $VERSION

    if [ $VERSION = "latest" ]; then
        asdf global $PKG $(asdf list $PKG | tail -n 1)
    else
        asdf global $PKG $VERSION
    fi
}
