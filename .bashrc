# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc


# What I added
#
# bash options section (recommendations form archwiki)
export HISTCONTROL=erasedups
export HISTSIZE=10000
export HISTFILESIZE=10000
shopt -s histappend


# Aliases section
alias v='nvim $(fzf -m --preview="bat --color=always {}")'
alias vi="nvim"
alias dotfiles='git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME"'

# Package manager Aliases
alias duu="sudo dnf upgrade"
alias dii="sudo dnf install"
alias drr="sudo dnf autoremove"
alias dqq="sudo dnf search"

alias pii="sudo pacman -S"
alias puu="sudo pacman -Syu"
alias prr="sudo pacman -Rs"
alias pqq="sudo pacman -Ss"

function nii() { nix-env -iA nixpkgs.$@; }
alias nrr="nix-env -e"
alias nqq="nix search nixpkgs"
alias nuu="nix-channel --update; nix-env -u; nix-collect-garbage -d"

alias u="duu; flatpak upgrade; drr; distrobox upgrade -a"

# enable vim mode
set -o vi
bind -m vi-insert 'Control-l: clear-screen'

# integrate fzf with bash
eval "$(fzf --bash)"
