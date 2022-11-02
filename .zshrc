# Custom functions

source ~/dotfiles/functions.zsh

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="$HOME/bin:/usr/local/sbin:$HOME/.rd/bin:$PATH"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

export EDITOR="code"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="spaceship"

SPACESHIP_KUBECONTEXT_SHOW=false
SPACESHIP_DOCKER_SHOW=false
SPACESHIP_GIT_PREFIX="("
SPACESHIP_GIT_SUFFIX=") "
SPACESHIP_PROMPT_DEFAULT_PREFIX=""
SPACESHIP_PACKAGE_PREFIX="-> "
SPACESHIP_NODE_SUFFIX=" ($(readlink ~/.npmrc | cut -d '/' -f 5)) "
SPACESHIP_BATTERY_THRESHOLD=20

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# history size
HISTSIZE=5000
HISTFILESIZE=10000

SAVEHIST=5000
setopt EXTENDED_HISTORY
HISTFILE=${ZDOTDIR:-$HOME}/.zsh_history
# share history across multiple zsh sessions
setopt SHARE_HISTORY
# append to history
setopt APPEND_HISTORY
# adds commands as they are typed, not at shell exit
setopt INC_APPEND_HISTORY
# do not store duplications
setopt HIST_IGNORE_DUPS

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="dd/mm/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git node macos python extract fasd fast-syntax-highlighting zsh-autosuggestions zsh-completions git-extra-commands git-flow-completion zsh-history-substring-search
)

source $ZSH/oh-my-zsh.sh

# User configuration

autoload -U compinit && compinit

# fasd init
eval "$(fasd --init zsh-wcomp-install zsh-hook zsh-ccomp)"
alias j='fasd_cd -d'

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=es_ES.UTF-8

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"
export GPG_TTY=$(tty)

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases

# Android Development
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export JAVA_HOME="/Library/Java/JavaVirtualMachines/temurin-18.jdk/Contents/Home"

# Modern Unix Commands
# https://github.com/ibraheemdev/modern-unix
alias cat=/opt/homebrew/bin/bat

# GENERAL
alias zshrc='${=EDITOR} ~/.zshrc' # Quick access to the ~/.zshrc file
alias pip-update="pip3 list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip3 install -U"
alias hs='history | grep'
alias www='python -m http.server'
alias speed='speedtest-cli --server 2406 --simple'
alias ipe='curl ipinfo.io/ip'
alias proxyon='sh ~/scripts/proxy_on.sh'
alias proxyoff='sh ~/scripts/proxy_off.sh'
alias getnpmrc='readlink ~/.npmrc | cut -d '/' -f 5'
alias cpprogress='rsync -ah --progress '
function qr { curl qrcode.show/$@; }

# MAC
alias python="python3"
alias brewupdate="brew update && brew upgrade && brew upgrade --cask && brew cleanup -s && brew doctor && brew missing && pip-update"
alias hidedesk='defaults write com.apple.finder CreateDesktop -bool false; killall Finder;'
alias showdesk='defaults write com.apple.finder CreateDesktop -bool true; killall Finder;'
alias brewbck='rm -f ~/dotfiles/Brewfile && brew bundle dump && mv Brewfile ~/dotfiles/Brewfile'

# Filebot
function fbmovie { filebot -rename -r ./$@ --file-filter f.video --db TheMovieDB --format {ny}/{ny}{' CD'+pi}{subt} --output /Volumes/Movies; }
function fbserie { filebot -rename -r ./$@ --file-filter f.video --db TheTVDB --format "{n}/{'Season '+s}/{s00e00} - {t}" --output /Volumes/Series; }

# GIT
function gc { git commit -m "$@"; }
alias gs="git status";
alias gp="git pull";
alias gf="git fetch";
alias gpush="git push";
alias gd="git diff";
alias ga="git add .";
dif() { git diff --color --no-index "$1" "$2" | diff-so-fancy; }
cdiff() { code --diff "$1" "$2"; }
alias gits='git init && git add . && git commit -m "Starting repository"'
alias gac='ga && git commit -a -m '
grr() { git fetch -p && for branch in $(git for-each-ref --format '%(refname) %(upstream:track)' refs/heads | awk '$2 == "[gone]" {sub("refs/heads/", "", $1); print $1}'); do git branch -D $branch; done }

# NPM
alias ni="npm install";
alias nis='npm install --save'
alias nisd='npm install --save-dev'
alias npm-update="npx npm-check -u";
alias yarn-update="yarn upgrade-interactive --latest";
alias nrs="npm run start -s --";
alias nrb="npm run build -s --";
alias nrd="npm run dev -s --";
alias nrt="npm run test -s --";
alias nrtw="npm run test:watch -s --";
alias nrv="npm run validate -s --";
alias rmn="rm -rf node_modules";
alias flush-npm="rm -rf node_modules && npm i && say NPM is done";
alias nicache="npm install --prefer-offline";
alias nioff="npm install --offline";

## yarn aliases
alias yar="yarn run";
alias yas="yarn run start";
alias yab="yarn run build";
alias yat="yarn run test";
alias yav="yarn run validate";
alias yoff="yarn add --offline";
alias ypm="echo \"Installing deps without lockfile and ignoring engines\" && yarn install --no-lockfile --ignore-engines"

# CheatSheet
cht() { curl cht.sh/$1 }

# PROJECTS
cdd() {
  if [ -n "$1" ]
    then
      cd ~/code/$1
    else
      cd ~/code
  fi
}

mg () { mkdir "$@" && cd "$@" || exit; }
npm-latest() { npm info "$1" | grep latest; }
killport() { lsof -i tcp:"$*" | awk 'NR!=1 {print $2}' | xargs kill -9 ;}
weather() { curl "http://wttr.in/$1\?lang\=es"; }

# Other alias
alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'
alias flushdns="sudo dscacheutil -flushcache;sudo killall -HUP mDNSResponder"
alias findprocess="ps -ax | grep -i"
alias sign="sudo xattr -r -d com.apple.quarantine"
alias daily="weather && echo "" && cal"

# Karabiner
alias karabinerLoad='launchctl load /Library/LaunchAgents/org.pqrs.karabiner.karabiner_console_user_server.plist; \
sudo launchctl load /Library/LaunchDaemons/org.pqrs.karabiner.karabiner_grabber.plist; \
sudo launchctl load /Library/LaunchDaemons/org.pqrs.karabiner.karabiner_observer.plist;'
alias karabinerUnload='launchctl unload /Library/LaunchAgents/org.pqrs.karabiner.karabiner_console_user_server.plist; \
sudo launchctl unload /Library/LaunchDaemons/org.pqrs.karabiner.karabiner_grabber.plist; \
sudo launchctl unload /Library/LaunchDaemons/org.pqrs.karabiner.karabiner_observer.plist; \
sudo killall karabiner_grabber; \
sudo killall karabiner_console_user_server; \
sudo killall Karabiner-Menu; \
sudo killall Karabiner-Elements'

# Other files

# Private / secret stuff - WORK_PROXY env variable
source ~/dotfiles/work_variables.zsh

eval $(thefuck --alias)

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

PATH="$HOME/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="$HOME/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="$HOME/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"$HOME/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=$HOME/perl5"; export PERL_MM_OPT;

# Volta
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
