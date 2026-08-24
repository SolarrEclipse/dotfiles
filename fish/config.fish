set fish_greeting

set -gx XDG_CONFIG_HOME ~/.config
set -gx XDG_STATE_HOME ~/.local/state
set -gx XDG_DATA_HOME ~/.local/share
set -gx XDG_MARCH_HOME ~/.local/share/march

set -gx SUDO_EDITOR nvim

alias bat "bat --theme=TwoDark"
alias ls "eza -l --icons=auto"

if status is-interactive
    starship init fish | source
    zoxide init fish --cmd cd | source
end
