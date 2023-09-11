# iTerm2 tab and window title
if [ $ITERM_SESSION_ID ]; then
  # Set tab title to current directory
  # the $PROMPT_COMMAND environment variable is executed every time a command is run
  export PROMPT_COMMAND='echo -ne "\033]1;${PWD##*/}\007"; ':"$PROMPT_COMMAND";
fi



export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

alias config='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'

export HOMEBREW_NO_UPDATE_CLEANUP=1
brewprefix=/usr/local/brew
export PATH="$brewprefix/bin:$brewprefix/sbin:$PATH"
export MANPATH="$brewprefix/share/man:$MANPATH"
unset brewprefix

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
. "$HOME/.cargo/env"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
