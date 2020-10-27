source ~/.config/fish/aliases.fish

fish_vi_key_bindings

if status --is-login
  [ -f ~/.config/fish/env.fish ]; and . ~/.config/fish/env.fish
end

####
# kawasaki theme
####
set -g theme_display_time no
set -g theme_display_group no
set -g theme_display_hostname yes
set -g theme_display_git yes
set -g theme_display_jobs no
set -g theme_display_jobs_always yes
set -g theme_display_rw no
set -g theme_display_virtualenv no
set -g theme_display_batt no
set -g theme_display_batt_icon no
