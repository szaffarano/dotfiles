#!/usr/bin/env fish
set PROG 'gopass'

function __fish_gopass_needs_command
  set -l cmd (commandline -opc)
  if [ (count $cmd) -eq 1 -a $cmd[1] = $PROG ]
    return 0
  end
  return 1
end

function __fish_gopass_uses_command
  set cmd (commandline -opc)
  if [ (count $cmd) -gt 1 ]
    if [ $argv[1] = $cmd[2] ]
      return 0
    end
  end
  return 1
end

function __fish_gopass_print_gpg_keys
  gpg2 --list-keys | grep uid | sed 's/.*&lt;\(.*\)>/\1/'
end

function __fish_gopass_print_entries
  gopass ls --flat
end

function __fish_gopass_print_dir
  for i in (gopass ls --flat)
	  echo (dirname $i)
	end | sort -u
end

# erase any existing completions for gopass
complete -c $PROG -e
complete -c $PROG -f -n '__fish_gopass_needs_command' -a "(__fish_gopass_print_entries)"
complete -c $PROG -f -s c -l clip -r -a "(__fish_gopass_print_entries)"
complete -c $PROG -f -n '__fish_gopass_needs_command' -a audit -d 'Command: Scan for weak passwords'
complete -c $PROG -f -n '__fish_gopass_uses_command audit' -a hibp -d 'Subcommand: Detect leaked passwords'
complete -c $PROG -f -n '__fish_gopass_uses_command audit hibp -l force -d "Force to move the secret and overwrite existing one"'
complete -c $PROG -f -n '__fish_gopass_uses_command audit hibp -l api -d "Use HIBP API"'
complete -c $PROG -f -n '__fish_gopass_uses_command audit hibp -l dumps -d "One or more HIBP v1/v2 dumps"'
complete -c $PROG -f -n '__fish_gopass_uses_command audit hibp -l yes -d "Assume yes on all yes/no questions or use the default on all others"'
complete -c $PROG -f -n '__fish_gopass_uses_command audit hibp -l clip -d "Copy the first line of the secret into the clipboard"'
complete -c $PROG -f -n '__fish_gopass_uses_command audit hibp -l alsoclip -d "Copy the first line of the secret into the clipboard and show everything"'
complete -c $PROG -f -n '__fish_gopass_uses_command audit hibp -l help -d "show help"'
complete -c $PROG -f -n '__fish_gopass_uses_command audit hibp -l version -d "print the version"'
complete -c $PROG -f -n '__fish_gopass_needs_command' -a binary -d 'Command: Assist with Binary/Base64 content'
complete -c $PROG -f -n '__fish_gopass_uses_command binary' -a cat -d 'Subcommand: Print content of a secret to stdout, or insert from stdin'
complete -c $PROG -f -n '__fish_gopass_uses_command binary cat -l yes -d "Assume yes on all yes/no questions or use the default on all others"'
complete -c $PROG -f -n '__fish_gopass_uses_command binary cat -l clip -d "Copy the first line of the secret into the clipboard"'
complete -c $PROG -f -n '__fish_gopass_uses_command binary cat -l alsoclip -d "Copy the first line of the secret into the clipboard and show everything"'
complete -c $PROG -f -n '__fish_gopass_uses_command binary cat -l help -d "show help"'
complete -c $PROG -f -n '__fish_gopass_uses_command binary cat -l version -d "print the version"'
complete -c $PROG -f -n '__fish_gopass_uses_command binary' -a sum -d 'Subcommand: Compute the SHA256 checksum'
complete -c $PROG -f -n '__fish_gopass_uses_command binary sum -l yes -d "Assume yes on all yes/no questions or use the default on all others"'
complete -c $PROG -f -n '__fish_gopass_uses_command binary sum -l clip -d "Copy the first line of the secret into the clipboard"'
complete -c $PROG -f -n '__fish_gopass_uses_command binary sum -l alsoclip -d "Copy the first line of the secret into the clipboard and show everything"'
complete -c $PROG -f -n '__fish_gopass_uses_command binary sum -l help -d "show help"'
complete -c $PROG -f -n '__fish_gopass_uses_command binary sum -l version -d "print the version"'
complete -c $PROG -f -n '__fish_gopass_uses_command binary' -a copy -d 'Subcommand: Copy files from or to the password store'
complete -c $PROG -f -n '__fish_gopass_uses_command binary copy -l force -d "Force to move the secret and overwrite existing one"'
complete -c $PROG -f -n '__fish_gopass_uses_command binary copy -l yes -d "Assume yes on all yes/no questions or use the default on all others"'
complete -c $PROG -f -n '__fish_gopass_uses_command binary copy -l clip -d "Copy the first line of the secret into the clipboard"'
complete -c $PROG -f -n '__fish_gopass_uses_command binary copy -l alsoclip -d "Copy the first line of the secret into the clipboard and show everything"'
complete -c $PROG -f -n '__fish_gopass_uses_command binary copy -l help -d "show help"'
complete -c $PROG -f -n '__fish_gopass_uses_command binary copy -l version -d "print the version"'
complete -c $PROG -f -n '__fish_gopass_uses_command binary' -a move -d 'Subcommand: Move files from or to the password store'
complete -c $PROG -f -n '__fish_gopass_uses_command binary move -l force -d "Force to move the secret and overwrite existing one"'
complete -c $PROG -f -n '__fish_gopass_uses_command binary move -l yes -d "Assume yes on all yes/no questions or use the default on all others"'
complete -c $PROG -f -n '__fish_gopass_uses_command binary move -l clip -d "Copy the first line of the secret into the clipboard"'
complete -c $PROG -f -n '__fish_gopass_uses_command binary move -l alsoclip -d "Copy the first line of the secret into the clipboard and show everything"'
complete -c $PROG -f -n '__fish_gopass_uses_command binary move -l help -d "show help"'
complete -c $PROG -f -n '__fish_gopass_uses_command binary move -l version -d "print the version"'
complete -c $PROG -f -n '__fish_gopass_needs_command' -a clone -d 'Command: Clone a store from git'
complete -c $PROG -f -n '__fish_gopass_needs_command' -a completion -d 'Command: Bash and ZSH completion'
complete -c $PROG -f -n '__fish_gopass_uses_command completion' -a bash -d 'Subcommand: Source for auto completion in bash'
complete -c $PROG -f -n '__fish_gopass_uses_command completion bash -l yes -d "Assume yes on all yes/no questions or use the default on all others"'
complete -c $PROG -f -n '__fish_gopass_uses_command completion bash -l clip -d "Copy the first line of the secret into the clipboard"'
complete -c $PROG -f -n '__fish_gopass_uses_command completion bash -l alsoclip -d "Copy the first line of the secret into the clipboard and show everything"'
complete -c $PROG -f -n '__fish_gopass_uses_command completion bash -l help -d "show help"'
complete -c $PROG -f -n '__fish_gopass_uses_command completion bash -l version -d "print the version"'
complete -c $PROG -f -n '__fish_gopass_uses_command completion' -a zsh -d 'Subcommand: Source for auto completion in zsh'
complete -c $PROG -f -n '__fish_gopass_uses_command completion zsh -l yes -d "Assume yes on all yes/no questions or use the default on all others"'
complete -c $PROG -f -n '__fish_gopass_uses_command completion zsh -l clip -d "Copy the first line of the secret into the clipboard"'
complete -c $PROG -f -n '__fish_gopass_uses_command completion zsh -l alsoclip -d "Copy the first line of the secret into the clipboard and show everything"'
complete -c $PROG -f -n '__fish_gopass_uses_command completion zsh -l help -d "show help"'
complete -c $PROG -f -n '__fish_gopass_uses_command completion zsh -l version -d "print the version"'
complete -c $PROG -f -n '__fish_gopass_uses_command completion' -a fish -d 'Subcommand: Source for auto completion in fish'
complete -c $PROG -f -n '__fish_gopass_uses_command completion fish -l help -d "show help"'
complete -c $PROG -f -n '__fish_gopass_uses_command completion fish -l yes -d "Assume yes on all yes/no questions or use the default on all others"'
complete -c $PROG -f -n '__fish_gopass_uses_command completion fish -l clip -d "Copy the first line of the secret into the clipboard"'
complete -c $PROG -f -n '__fish_gopass_uses_command completion fish -l alsoclip -d "Copy the first line of the secret into the clipboard and show everything"'
complete -c $PROG -f -n '__fish_gopass_uses_command completion fish -l help -d "show help"'
complete -c $PROG -f -n '__fish_gopass_uses_command completion fish -l version -d "print the version"'
complete -c $PROG -f -n '__fish_gopass_uses_command completion' -a openbsdksh -d 'Subcommand: Source for auto completion in OpenBSD&#39;s ksh'
complete -c $PROG -f -n '__fish_gopass_uses_command completion openbsdksh -l yes -d "Assume yes on all yes/no questions or use the default on all others"'
complete -c $PROG -f -n '__fish_gopass_uses_command completion openbsdksh -l clip -d "Copy the first line of the secret into the clipboard"'
complete -c $PROG -f -n '__fish_gopass_uses_command completion openbsdksh -l alsoclip -d "Copy the first line of the secret into the clipboard and show everything"'
complete -c $PROG -f -n '__fish_gopass_uses_command completion openbsdksh -l help -d "show help"'
complete -c $PROG -f -n '__fish_gopass_uses_command completion openbsdksh -l version -d "print the version"'
complete -c $PROG -f -n '__fish_gopass_needs_command' -a config -d 'Command: Edit configuration'
complete -c $PROG -f -n '__fish_gopass_needs_command' -a copy -d 'Command: Copy secrets from one location to another'
complete -c $PROG -f -n '__fish_gopass_uses_command copy' -a "(__fish_gopass_print_entries)"
complete -c $PROG -f -n '__fish_gopass_needs_command' -a create -d 'Command: Easy creation of new secrets'
complete -c $PROG -f -n '__fish_gopass_needs_command' -a delete -d 'Command: Remove secrets'
complete -c $PROG -f -n '__fish_gopass_uses_command delete' -a "(__fish_gopass_print_entries)"
complete -c $PROG -f -n '__fish_gopass_needs_command' -a edit -d 'Command: Edit new or existing secrets'
complete -c $PROG -f -n '__fish_gopass_uses_command edit' -a "(__fish_gopass_print_entries)"
complete -c $PROG -f -n '__fish_gopass_needs_command' -a env -d 'Command: Run a subprocess with a pre-populated environment'
complete -c $PROG -f -n '__fish_gopass_needs_command' -a find -d 'Command: Search for secrets'
complete -c $PROG -f -n '__fish_gopass_needs_command' -a fsck -d 'Command: Check store integrity'
complete -c $PROG -f -n '__fish_gopass_needs_command' -a generate -d 'Command: Generate a new password'
complete -c $PROG -f -n '__fish_gopass_uses_command generate' -a "(__fish_gopass_print_dir)"
complete -c $PROG -f -n '__fish_gopass_needs_command' -a git -d 'Command: Run a git command inside a password store (init, remote, push, pull)'
complete -c $PROG -f -n '__fish_gopass_uses_command git' -a init -d 'Subcommand: Init git repo'
complete -c $PROG -f -n '__fish_gopass_uses_command git init -l store -d "Store to operate on"'
complete -c $PROG -f -n '__fish_gopass_uses_command git init -l sign-key -d "GPG Key to sign commits"'
complete -c $PROG -f -n '__fish_gopass_uses_command git init -l rcs -d "Select sync backend (git, gitcli, noop)"'
complete -c $PROG -f -n '__fish_gopass_uses_command git init -l yes -d "Assume yes on all yes/no questions or use the default on all others"'
complete -c $PROG -f -n '__fish_gopass_uses_command git init -l clip -d "Copy the first line of the secret into the clipboard"'
complete -c $PROG -f -n '__fish_gopass_uses_command git init -l alsoclip -d "Copy the first line of the secret into the clipboard and show everything"'
complete -c $PROG -f -n '__fish_gopass_uses_command git init -l help -d "show help"'
complete -c $PROG -f -n '__fish_gopass_uses_command git init -l version -d "print the version"'
complete -c $PROG -f -n '__fish_gopass_uses_command git' -a remote -d 'Subcommand: Manage git remotes'
complete -c $PROG -f -n '__fish_gopass_uses_command git remote -l yes -d "Assume yes on all yes/no questions or use the default on all others"'
complete -c $PROG -f -n '__fish_gopass_uses_command git remote -l clip -d "Copy the first line of the secret into the clipboard"'
complete -c $PROG -f -n '__fish_gopass_uses_command git remote -l alsoclip -d "Copy the first line of the secret into the clipboard and show everything"'
complete -c $PROG -f -n '__fish_gopass_uses_command git remote -l help -d "show help"'
complete -c $PROG -f -n '__fish_gopass_uses_command git remote -l version -d "print the version"'
complete -c $PROG -f -n '__fish_gopass_uses_command git' -a push -d 'Subcommand: Push to remote'
complete -c $PROG -f -n '__fish_gopass_uses_command git push -l store -d "Store to operate on"'
complete -c $PROG -f -n '__fish_gopass_uses_command git push -l yes -d "Assume yes on all yes/no questions or use the default on all others"'
complete -c $PROG -f -n '__fish_gopass_uses_command git push -l clip -d "Copy the first line of the secret into the clipboard"'
complete -c $PROG -f -n '__fish_gopass_uses_command git push -l alsoclip -d "Copy the first line of the secret into the clipboard and show everything"'
complete -c $PROG -f -n '__fish_gopass_uses_command git push -l help -d "show help"'
complete -c $PROG -f -n '__fish_gopass_uses_command git push -l version -d "print the version"'
complete -c $PROG -f -n '__fish_gopass_uses_command git' -a pull -d 'Subcommand: Pull from remote'
complete -c $PROG -f -n '__fish_gopass_uses_command git pull -l store -d "Store to operate on"'
complete -c $PROG -f -n '__fish_gopass_uses_command git pull -l yes -d "Assume yes on all yes/no questions or use the default on all others"'
complete -c $PROG -f -n '__fish_gopass_uses_command git pull -l clip -d "Copy the first line of the secret into the clipboard"'
complete -c $PROG -f -n '__fish_gopass_uses_command git pull -l alsoclip -d "Copy the first line of the secret into the clipboard and show everything"'
complete -c $PROG -f -n '__fish_gopass_uses_command git pull -l help -d "show help"'
complete -c $PROG -f -n '__fish_gopass_uses_command git pull -l version -d "print the version"'
complete -c $PROG -f -n '__fish_gopass_uses_command git' -a status -d 'Subcommand: RCS status'
complete -c $PROG -f -n '__fish_gopass_uses_command git status -l store -d "Store to operate on"'
complete -c $PROG -f -n '__fish_gopass_uses_command git status -l yes -d "Assume yes on all yes/no questions or use the default on all others"'
complete -c $PROG -f -n '__fish_gopass_uses_command git status -l clip -d "Copy the first line of the secret into the clipboard"'
complete -c $PROG -f -n '__fish_gopass_uses_command git status -l alsoclip -d "Copy the first line of the secret into the clipboard and show everything"'
complete -c $PROG -f -n '__fish_gopass_uses_command git status -l help -d "show help"'
complete -c $PROG -f -n '__fish_gopass_uses_command git status -l version -d "print the version"'
complete -c $PROG -f -n '__fish_gopass_needs_command' -a git-credential -d 'Command: Use &#34;!gopass git-credential $@&#34; as git&#39;s credential.helper'
complete -c $PROG -f -n '__fish_gopass_uses_command git-credential' -a get -d 'Subcommand: '
complete -c $PROG -f -n '__fish_gopass_uses_command git-credential get -l yes -d "Assume yes on all yes/no questions or use the default on all others"'
complete -c $PROG -f -n '__fish_gopass_uses_command git-credential get -l clip -d "Copy the first line of the secret into the clipboard"'
complete -c $PROG -f -n '__fish_gopass_uses_command git-credential get -l alsoclip -d "Copy the first line of the secret into the clipboard and show everything"'
complete -c $PROG -f -n '__fish_gopass_uses_command git-credential get -l help -d "show help"'
complete -c $PROG -f -n '__fish_gopass_uses_command git-credential get -l version -d "print the version"'
complete -c $PROG -f -n '__fish_gopass_uses_command git-credential' -a store -d 'Subcommand: '
complete -c $PROG -f -n '__fish_gopass_uses_command git-credential store -l yes -d "Assume yes on all yes/no questions or use the default on all others"'
complete -c $PROG -f -n '__fish_gopass_uses_command git-credential store -l clip -d "Copy the first line of the secret into the clipboard"'
complete -c $PROG -f -n '__fish_gopass_uses_command git-credential store -l alsoclip -d "Copy the first line of the secret into the clipboard and show everything"'
complete -c $PROG -f -n '__fish_gopass_uses_command git-credential store -l help -d "show help"'
complete -c $PROG -f -n '__fish_gopass_uses_command git-credential store -l version -d "print the version"'
complete -c $PROG -f -n '__fish_gopass_uses_command git-credential' -a erase -d 'Subcommand: '
complete -c $PROG -f -n '__fish_gopass_uses_command git-credential erase -l yes -d "Assume yes on all yes/no questions or use the default on all others"'
complete -c $PROG -f -n '__fish_gopass_uses_command git-credential erase -l clip -d "Copy the first line of the secret into the clipboard"'
complete -c $PROG -f -n '__fish_gopass_uses_command git-credential erase -l alsoclip -d "Copy the first line of the secret into the clipboard and show everything"'
complete -c $PROG -f -n '__fish_gopass_uses_command git-credential erase -l help -d "show help"'
complete -c $PROG -f -n '__fish_gopass_uses_command git-credential erase -l version -d "print the version"'
complete -c $PROG -f -n '__fish_gopass_uses_command git-credential' -a configure -d 'Subcommand: '
complete -c $PROG -f -n '__fish_gopass_uses_command git-credential configure -l global -d "Install for current user"'
complete -c $PROG -f -n '__fish_gopass_uses_command git-credential configure -l local -d "Install for current repository only"'
complete -c $PROG -f -n '__fish_gopass_uses_command git-credential configure -l system -d "Install for all users, requires superuser rights"'
complete -c $PROG -f -n '__fish_gopass_uses_command git-credential configure -l yes -d "Assume yes on all yes/no questions or use the default on all others"'
complete -c $PROG -f -n '__fish_gopass_uses_command git-credential configure -l clip -d "Copy the first line of the secret into the clipboard"'
complete -c $PROG -f -n '__fish_gopass_uses_command git-credential configure -l alsoclip -d "Copy the first line of the secret into the clipboard and show everything"'
complete -c $PROG -f -n '__fish_gopass_uses_command git-credential configure -l help -d "show help"'
complete -c $PROG -f -n '__fish_gopass_uses_command git-credential configure -l version -d "print the version"'
complete -c $PROG -f -n '__fish_gopass_needs_command' -a grep -d 'Command: Search for secrets files containing search-string when decrypted.'
complete -c $PROG -f -n '__fish_gopass_needs_command' -a history -d 'Command: Show password history'
complete -c $PROG -f -n '__fish_gopass_needs_command' -a init -d 'Command: Initialize new password store.'
complete -c $PROG -f -n '__fish_gopass_needs_command' -a insert -d 'Command: Insert a new secret'
complete -c $PROG -f -n '__fish_gopass_uses_command insert' -a "(__fish_gopass_print_dir)"
complete -c $PROG -f -n '__fish_gopass_needs_command' -a jsonapi -d 'Command: Run and configure gopass as jsonapi e.g. for browser plugins'
complete -c $PROG -f -n '__fish_gopass_uses_command jsonapi' -a listen -d 'Subcommand: Listen and respond to messages via stdin/stdout'
complete -c $PROG -f -n '__fish_gopass_uses_command jsonapi listen -l yes -d "Assume yes on all yes/no questions or use the default on all others"'
complete -c $PROG -f -n '__fish_gopass_uses_command jsonapi listen -l clip -d "Copy the first line of the secret into the clipboard"'
complete -c $PROG -f -n '__fish_gopass_uses_command jsonapi listen -l alsoclip -d "Copy the first line of the secret into the clipboard and show everything"'
complete -c $PROG -f -n '__fish_gopass_uses_command jsonapi listen -l help -d "show help"'
complete -c $PROG -f -n '__fish_gopass_uses_command jsonapi listen -l version -d "print the version"'
complete -c $PROG -f -n '__fish_gopass_uses_command jsonapi' -a configure -d 'Subcommand: Setup gopass native messaging manifest for selected browser'
complete -c $PROG -f -n '__fish_gopass_uses_command jsonapi configure -l browser -d "One of &#39;chrome&#39; and &#39;firefox&#39;"'
complete -c $PROG -f -n '__fish_gopass_uses_command jsonapi configure -l path -d "Path to install &#39;gopass_wrapper.sh&#39; to"'
complete -c $PROG -f -n '__fish_gopass_uses_command jsonapi configure -l manifest-path -d "Path to install &#39;com.justwatch.gopass.json&#39; to"'
complete -c $PROG -f -n '__fish_gopass_uses_command jsonapi configure -l global -d "Install for all users, requires superuser rights"'
complete -c $PROG -f -n '__fish_gopass_uses_command jsonapi configure -l libpath -d "Library path for global installation on linux. Default is /usr/lib"'
complete -c $PROG -f -n '__fish_gopass_uses_command jsonapi configure -l gopass-path -d "Path to gopass binary. Default is auto detected"'
complete -c $PROG -f -n '__fish_gopass_uses_command jsonapi configure -l print -d "Print installation summary before creating any files"'
complete -c $PROG -f -n '__fish_gopass_uses_command jsonapi configure -l yes -d "Assume yes on all yes/no questions or use the default on all others"'
complete -c $PROG -f -n '__fish_gopass_uses_command jsonapi configure -l clip -d "Copy the first line of the secret into the clipboard"'
complete -c $PROG -f -n '__fish_gopass_uses_command jsonapi configure -l alsoclip -d "Copy the first line of the secret into the clipboard and show everything"'
complete -c $PROG -f -n '__fish_gopass_uses_command jsonapi configure -l help -d "show help"'
complete -c $PROG -f -n '__fish_gopass_uses_command jsonapi configure -l version -d "print the version"'
complete -c $PROG -f -n '__fish_gopass_needs_command' -a list -d 'Command: List existing secrets'
complete -c $PROG -f -n '__fish_gopass_uses_command list' -a "(__fish_gopass_print_dir)"
complete -c $PROG -f -n '__fish_gopass_needs_command' -a mounts -d 'Command: Edit mounted stores'
complete -c $PROG -f -n '__fish_gopass_uses_command mounts' -a add -d 'Subcommand: Mount a password store'
complete -c $PROG -f -n '__fish_gopass_uses_command mounts add -l init -d "Init the store with the given recipient key"'
complete -c $PROG -f -n '__fish_gopass_uses_command mounts add -l yes -d "Assume yes on all yes/no questions or use the default on all others"'
complete -c $PROG -f -n '__fish_gopass_uses_command mounts add -l clip -d "Copy the first line of the secret into the clipboard"'
complete -c $PROG -f -n '__fish_gopass_uses_command mounts add -l alsoclip -d "Copy the first line of the secret into the clipboard and show everything"'
complete -c $PROG -f -n '__fish_gopass_uses_command mounts add -l help -d "show help"'
complete -c $PROG -f -n '__fish_gopass_uses_command mounts add -l version -d "print the version"'
complete -c $PROG -f -n '__fish_gopass_uses_command mounts' -a remove -d 'Subcommand: Umount an mounted password store'
complete -c $PROG -f -n '__fish_gopass_uses_command mounts remove -l yes -d "Assume yes on all yes/no questions or use the default on all others"'
complete -c $PROG -f -n '__fish_gopass_uses_command mounts remove -l clip -d "Copy the first line of the secret into the clipboard"'
complete -c $PROG -f -n '__fish_gopass_uses_command mounts remove -l alsoclip -d "Copy the first line of the secret into the clipboard and show everything"'
complete -c $PROG -f -n '__fish_gopass_uses_command mounts remove -l help -d "show help"'
complete -c $PROG -f -n '__fish_gopass_uses_command mounts remove -l version -d "print the version"'
complete -c $PROG -f -n '__fish_gopass_needs_command' -a move -d 'Command: Move secrets from one location to another'
complete -c $PROG -f -n '__fish_gopass_uses_command move' -a "(__fish_gopass_print_entries)"
complete -c $PROG -f -n '__fish_gopass_needs_command' -a otp -d 'Command: Generate time- or hmac-based tokens'
complete -c $PROG -f -n '__fish_gopass_needs_command' -a pwgen -d 'Command: Generate passwords'
complete -c $PROG -f -n '__fish_gopass_needs_command' -a recipients -d 'Command: Edit recipient permissions'
complete -c $PROG -f -n '__fish_gopass_uses_command recipients' -a add -d 'Subcommand: Add any number of Recipients to any store'
complete -c $PROG -f -n '__fish_gopass_uses_command recipients add -l store -d "Store to operate on"'
complete -c $PROG -f -n '__fish_gopass_uses_command recipients add -l force -d "Force adding non-existing keys"'
complete -c $PROG -f -n '__fish_gopass_uses_command recipients add -l yes -d "Assume yes on all yes/no questions or use the default on all others"'
complete -c $PROG -f -n '__fish_gopass_uses_command recipients add -l clip -d "Copy the first line of the secret into the clipboard"'
complete -c $PROG -f -n '__fish_gopass_uses_command recipients add -l alsoclip -d "Copy the first line of the secret into the clipboard and show everything"'
complete -c $PROG -f -n '__fish_gopass_uses_command recipients add -l help -d "show help"'
complete -c $PROG -f -n '__fish_gopass_uses_command recipients add -l version -d "print the version"'
complete -c $PROG -f -n '__fish_gopass_uses_command recipients' -a remove -d 'Subcommand: Remove any number of Recipients from any store'
complete -c $PROG -f -n '__fish_gopass_uses_command recipients remove -l store -d "Store to operate on"'
complete -c $PROG -f -n '__fish_gopass_uses_command recipients remove -l force -d "Force adding non-existing keys"'
complete -c $PROG -f -n '__fish_gopass_uses_command recipients remove -l yes -d "Assume yes on all yes/no questions or use the default on all others"'
complete -c $PROG -f -n '__fish_gopass_uses_command recipients remove -l clip -d "Copy the first line of the secret into the clipboard"'
complete -c $PROG -f -n '__fish_gopass_uses_command recipients remove -l alsoclip -d "Copy the first line of the secret into the clipboard and show everything"'
complete -c $PROG -f -n '__fish_gopass_uses_command recipients remove -l help -d "show help"'
complete -c $PROG -f -n '__fish_gopass_uses_command recipients remove -l version -d "print the version"'
complete -c $PROG -f -n '__fish_gopass_uses_command recipients' -a update -d 'Subcommand: Recompute the saved recipient list checksums'
complete -c $PROG -f -n '__fish_gopass_uses_command recipients update -l yes -d "Assume yes on all yes/no questions or use the default on all others"'
complete -c $PROG -f -n '__fish_gopass_uses_command recipients update -l clip -d "Copy the first line of the secret into the clipboard"'
complete -c $PROG -f -n '__fish_gopass_uses_command recipients update -l alsoclip -d "Copy the first line of the secret into the clipboard and show everything"'
complete -c $PROG -f -n '__fish_gopass_uses_command recipients update -l help -d "show help"'
complete -c $PROG -f -n '__fish_gopass_uses_command recipients update -l version -d "print the version"'
complete -c $PROG -f -n '__fish_gopass_needs_command' -a setup -d 'Command: Initialize a new password store'
complete -c $PROG -f -n '__fish_gopass_needs_command' -a show -d 'Command: Display a secret'
complete -c $PROG -f -n '__fish_gopass_uses_command show' -a "(__fish_gopass_print_entries)"
complete -c $PROG -f -n '__fish_gopass_needs_command' -a sync -d 'Command: Sync all local stores with their remotes'
complete -c $PROG -f -n '__fish_gopass_needs_command' -a templates -d 'Command: Edit templates'
complete -c $PROG -f -n '__fish_gopass_uses_command templates' -a show -d 'Subcommand: Show a secret template.'
complete -c $PROG -f -n '__fish_gopass_uses_command templates show -l yes -d "Assume yes on all yes/no questions or use the default on all others"'
complete -c $PROG -f -n '__fish_gopass_uses_command templates show -l clip -d "Copy the first line of the secret into the clipboard"'
complete -c $PROG -f -n '__fish_gopass_uses_command templates show -l alsoclip -d "Copy the first line of the secret into the clipboard and show everything"'
complete -c $PROG -f -n '__fish_gopass_uses_command templates show -l help -d "show help"'
complete -c $PROG -f -n '__fish_gopass_uses_command templates show -l version -d "print the version"'
complete -c $PROG -f -n '__fish_gopass_uses_command templates' -a edit -d 'Subcommand: Edit secret templates.'
complete -c $PROG -f -n '__fish_gopass_uses_command templates edit -l yes -d "Assume yes on all yes/no questions or use the default on all others"'
complete -c $PROG -f -n '__fish_gopass_uses_command templates edit -l clip -d "Copy the first line of the secret into the clipboard"'
complete -c $PROG -f -n '__fish_gopass_uses_command templates edit -l alsoclip -d "Copy the first line of the secret into the clipboard and show everything"'
complete -c $PROG -f -n '__fish_gopass_uses_command templates edit -l help -d "show help"'
complete -c $PROG -f -n '__fish_gopass_uses_command templates edit -l version -d "print the version"'
complete -c $PROG -f -n '__fish_gopass_uses_command templates' -a remove -d 'Subcommand: Remove secret templates.'
complete -c $PROG -f -n '__fish_gopass_uses_command templates remove -l yes -d "Assume yes on all yes/no questions or use the default on all others"'
complete -c $PROG -f -n '__fish_gopass_uses_command templates remove -l clip -d "Copy the first line of the secret into the clipboard"'
complete -c $PROG -f -n '__fish_gopass_uses_command templates remove -l alsoclip -d "Copy the first line of the secret into the clipboard and show everything"'
complete -c $PROG -f -n '__fish_gopass_uses_command templates remove -l help -d "show help"'
complete -c $PROG -f -n '__fish_gopass_uses_command templates remove -l version -d "print the version"'
complete -c $PROG -f -n '__fish_gopass_needs_command' -a unclip -d 'Command: Internal command to clear clipboard'
complete -c $PROG -f -n '__fish_gopass_needs_command' -a update -d 'Command: Check for updates'
complete -c $PROG -f -n '__fish_gopass_needs_command' -a version -d 'Command: Display version'
complete -c $PROG -f -n '__fish_gopass_needs_command' -a help -d 'Command: Shows a list of commands or help for one command'