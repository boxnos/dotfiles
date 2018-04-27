bindkey -e

# History
HISTFILE=${ZDOTDIR}/.zsh-history
HISTSIZE=1000
SAVEHIST=10000
setopt hist_ignore_all_dups
setopt extended_history
setopt share_history

autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

bindkey "^[p" history-beginning-search-backward
bindkey "^[n" history-beginning-search-forward

# Completion
zstyle :compinstall filename '${ZDOTDIR}/.zshrc'

fpath=(${ZDOTDIR}/.completions $fpath)
autoload -Uz compinit
compinit

setopt auto_cd
setopt auto_pushd
setopt globdots

# hash(private)
source ${ZDOTDIR}/.hashes

# Prompt
PROMPT="%% "
RPROMPT="[%~]"
setopt transient_rprompt

# rbenv
export ANYENV_ROOT=$HOME/.config/anyenv
export PATH="$ANYENV_ROOT/bin:$PATH"
eval "$(anyenv init -)"

# aliases
alias xd='od -Ax -tx1z'
