bindkey -e

# history
HISTFILE=${ZDOTDIR}/.zsh-history
HISTSIZE=1000
SAVEHIST=10000
setopt hist_ignore_all_dups
setopt extended_history
setopt share_history


# The following lines were added by compinstall
zstyle :compinstall filename '${ZDOTDIR}/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# prompt
PROMPT="%% "
RPROMPT="[%~]"
setopt transient_rprompt
