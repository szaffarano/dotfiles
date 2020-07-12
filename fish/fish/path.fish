set RUST_VERSION (asdf current rust | cut -d" " -f 1)

if ! [ -z $RUST_VERSION ]
  set PATH $PATH ~/.asdf/installs/rust/$RUST_VERSION/bin
end

set --export PATH $PATH 
