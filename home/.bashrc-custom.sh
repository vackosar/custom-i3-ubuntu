export downloads="/sdb5/data/downloads";
alias ideaopen='intellij-idea-community --line 0'

#export PATH="$PATH:/opt/google_appengine_1.9.69/";

export CHROME_BIN=chromium-browser
export syncDir="/home/vackosar/Dropbox/rsr/sync"

export PS1="\n\t>\n"
shopt -s histappend                      # append to history, don't overwrite it
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=9999
HISTFILESIZE=9999
shopt -s globstar

foreach () { while IFS= read -r l; do eval "$@"; done; }

alias t="touch"
alias cdTsk='cd "$HOME/tsk"'

#/home/vackosar/tsk/update.sh 2>/dev/null &

export PATH="$PATH:$HOME/bin";
# The next line enables shell command completion for gcloud.
#if [ -f '/home/vackosar/Downloads/google-cloud-sdk/completion.bash.inc' ]; then . '/home/vackosar/Downloads/google-cloud-sdk/completion.bash.inc'; fi

#set -o vi
export EDITOR=vi
