set RUST_VERSION (asdf current rust | cut -d" " -f 1)

if ! [ -z $RUST_VERSION ]
  set custom $custom ~/.asdf/installs/rust/$RUST_VERSION/bin
end

set -U fish_user_paths $fish_user_paths $custom
