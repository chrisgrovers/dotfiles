# iTerm2 tab and window title
if [ $ITERM_SESSION_ID ]; then
  # Set tab title to current directory
  # the $PROMPT_COMMAND environment variable is executed every time a command is run
  export PROMPT_COMMAND='echo -ne "\033]1;${PWD##*/}\007"; ':"$PROMPT_COMMAND";
fi



export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

alias config='/usr/bin/git --git-dir=/Users/cgrovers/dotfiles --work-tree=/Users/cgrovers'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
