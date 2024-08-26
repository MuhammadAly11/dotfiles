autoload -U colors && colors	# Load colors
setopt autocd		# Automatically cd into typed directory.

# Prompt
PROMPT="%F{yellow}%~%f
%F{blue}>> %f"

# Add aliases
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliasrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliasrc"

# Completions
autoload -Uz compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
_comp_options+=(globdots)   # Include hidden files
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' # Make completions case insisative
compinit

# History settings
HISTTIMEFORMAT="%d/%m/%Y %H:%M] "
HISTSIZE=100000
SAVEHIST=100000
setopt HIST_IGNORE_SPACE  # Don't save when prefixed with space
setopt HIST_IGNORE_DUPS   # Don't save duplicate lines
setopt INC_APPEND_HISTORY      # Save history after each command

# Vi mode
bindkey -v

# Use vim keys in tab complete menu:
bindkey -M menuselect '^h' vi-backward-char
bindkey -M menuselect '^k' vi-up-line-or-history
bindkey -M menuselect '^l' vi-forward-char
bindkey -M menuselect '^j' vi-down-line-or-history

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line
bindkey -M vicmd '^e' edit-command-line

# source fzf and zoxide
source <(fzf --zsh)
eval "$(zoxide init zsh)"
