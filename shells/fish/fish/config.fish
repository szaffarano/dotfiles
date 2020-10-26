source ~/.config/fish/aliases.fish

fish_vi_key_bindings

if status --is-login
  [ -f ~/.config/fish/env.fish ]; and . ~/.config/fish/env.fish
end
