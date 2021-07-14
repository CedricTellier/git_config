# Path to your oh-my-bash installation.
export OSH=/home/noob/.oh-my-bash
OSH_THEME="agnoster"

# CASE_SENSITIVE="true"
# HYPHEN_INSENSITIVE="true"
# DISABLE_AUTO_UPDATE="true"
# export UPDATE_OSH_DAYS=13
# DISABLE_LS_COLORS="true"
# DISABLE_AUTO_TITLE="true"
# ENABLE_CORRECTION="true"
# COMPLETION_WAITING_DOTS="true"
# DISABLE_UNTRACKED_FILES_DIRTY="true"
# HIST_STAMPS="mm/dd/yyyy"
# OSH_CUSTOM=/path/to/new-custom-folder

completions=(
  git
  composer
  ssh
)

aliases=(
  general
)

plugins=(
  git
  bashmarks
)

source $OSH/oh-my-bash.sh

# export MANPATH="/usr/local/man:$MANPATH"
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# export ARCHFLAGS="-arch x86_64"
# export SSH_KEY_PATH="~/.ssh/rsa_id"

alias gs='git status'
alias gb='git branch'
alias gl='git log'
alias ga='git add .'
alias gp='git pull'
alias gcp='git commit -m "$*" && git push'
alias gc='git commit -m "$*"'
alias gd='git diff'
alias grh='git reset --hard'
alias grmc='git add . && git rm -r --cached . && git add .gitignore && git add . && git status'
alias python='python3.9'