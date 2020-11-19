## Sebas's dotfiles

My personal dotfiles using [dotbot](https://github.com/anishathalye/dotbot) and
inspired in [vsund dotfiles](https://github.com/vsund/dotfiles).

## Usage

### Install a complete profile

```sh
$ ./install-profile <profile-name>
```
Where `<profile-name>` is one [of these](./meta/profiles) files.

### Install an specific config

```sh
$ ./install-standalone <config-name-1> [<config-name-2> ... ]
```
Where `<config-name-n>` is one [of these](./meta/configs) files.  You can use
many config at the same time.


## What does it include?

Some packages that are installed and/or configured (many of them using
[asdf](https://github.com/asdf-vm/asdf])) according to my preferences are:

- [CopyQ](https://github.com/hluk/CopyQ) clipboard manager
- [Fish shell](https://fishshell.com/)
- [Git](https://git-scm.com/)
- [GoLang](https://golang.org/)
- [i3 Window Manager](https://i3wm.org/)
- Java
- NodeJS
- Python
- Rust
- Scala
- ssh
- [Tmux](https://github.com/tmux/tmux/wiki)
- [Z Shell](https://www.zsh.org/) (outdated)
- ...
