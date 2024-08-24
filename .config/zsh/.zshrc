# Enable colors and change prompt:
autoload -U colors && colors	# Load colors
setopt autocd		# Automatically cd into typed directory.


# History settings
HISTTIMEFORMAT="%d/%m/%Y %H:%M] "
HISTSIZE=100000
SAVEHIST=100000
setopt HIST_IGNORE_SPACE  # Don't save when prefixed with space
setopt HIST_IGNORE_DUPS   # Don't save duplicate lines
setopt INC_APPEND_HISTORY      # Save history after each command

# Vi mode
set -o vi

# Add aliases
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliasrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliasrc"

# source fzf and zoxide
source <(fzf --zsh)
eval "$(zoxide init zsh)"

# Completions

autoload -Uz compinit
compinit -u

zstyle ':completion:*' menu select
