# zmodload zsh/zprof
# fix emacs tramp mode
[[ $TERM == "dumb" ]] && unsetopt zle && PS1='$ ' && return
# Path to your oh-my-zsh installation.
# export ZSH=/Users/fuyu0425/.oh-my-zsh
# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME=""

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
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
# ENABLE_CORRECTION="false"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"


# export MANPATH="/usr/local/man:$MANPATH"


# source $ZSH/oh-my-zsh.sh

unsetopt inc_append_history

setopt hist_reduce_blanks
setopt hist_save_no_dups

export ZPLUG_HOME=$HOME/.zplug

# Check if zplug is installed
if [[ ! -d $ZPLUG_HOME ]]; then
  git clone https://github.com/zplug/zplug $ZPLUG_HOME
  source $ZPLUG_HOME/init.zsh && zplug update --self
fi

source $HOME/.zplug/init.zsh

ZPLUG_LOG_LOAD_FAILURE=true
zplug 'zplug/zplug', hook-build:'zplug --self-manage'

# zsh users
zplug "zsh-users/zsh-completions",              defer:0
zplug "zsh-users/zsh-autosuggestions",          defer:2, on:"zsh-users/zsh-completions"
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=yellow" #support 256
zplug "zsh-users/zsh-syntax-highlighting",      defer:3, on:"zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-history-substring-search", defer:3, on:"zsh-users/zsh-syntax-highlighting"


zplug "b4b4r07/enhancd", use:init.sh
# zplug "popstas/zsh-command-time"
# If command execution time above min. time, plugins will not output time.
# ZSH_COMMAND_TIME_MIN_SECONDS=1
# Set it to "" for disable echo `time: xx`.
# ZSH_COMMAND_TIME_ECHO=1
# zplug "rupa/z", use:z.sh

# Plugins from oh my zsh
zplug "robbyrussell/oh-my-zsh", use:"lib/*.zsh"
zplug "plugins/asdf", from:oh-my-zsh, defer:2
#zplug "plugins/vi-mode", from:oh-my-zsh
zplug "plugins/sudo", from:oh-my-zsh
zplug "plugins/extract", from:oh-my-zsh
zplug "plugins/git", from:oh-my-zsh
#zplug "plugins/git-prompt", from:oh-my-zsh
## tmux
zplug "plugins/tmux", from:oh-my-zsh, defer:3
zplug "plugins/direnv", from:oh-my-zsh
zplug "plugins/docker", from:oh-my-zsh
zplug "plugins/docker-compose", from:oh-my-zsh
zplug "plugins/vagrant", from:oh-my-zsh
zplug "plugins/copydir", from:oh-my-zsh
zplug "plugins/copyfile", from:oh-my-zsh
zplug "plugins/copybuffer", from:oh-my-zsh
zplug "plugins/tig", from:oh-my-zsh
zplug "plugins/command-not-found", from:oh-my-zsh

# Tips for aliases
zplug "djui/alias-tips"

# fzf
zplug "junegunn/fzf-bin", from:gh-r, as:command, rename-to:fzf
zplug "junegunn/fzf", use:"shell/*.zsh", defer:2, on:"junegunn/fzf-bin"

#fasd
zplug "clvv/fasd", as:command, use:fasd
zplug "plugins/fasd", from:oh-my-zsh, on:"clvv/fasd"
zplug "wookayin/fzf-fasd"

# zplug "marlonrichert/zsh-autocomplete"

# zplug "~/.zsh", from:local, use:"fuyu0425.zsh-theme", as:theme
zplug "romkatv/powerlevel10k", as:theme, depth:1

zplug "mfaerevaag/wd", as:command, use:"wd.sh", hook-load:"wd() { . $ZPLUG_REPOS/mfaerevaag/wd/wd.sh }"

case `uname` in
    Darwin)
        zplug "plugins/osx", from:oh-my-zsh
        # zplug "tysonwolker/iterm-tab-colors"
        ;;
    Linux)
        ;;
esac


# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

###my own setting###
###################
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export TERM='xterm-256color'
export GOPATH=~/gocode


path=($HOME/.local/bin $HOME/bin $path)
# umask 077

# solve emacs shell problem


# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi
# Then, source plugins and add commands to $PATH
# zplug load --verbose
zplug load

function git-next() {
    git log --reverse --pretty=%H master | grep -A 1 $(git rev-parse HEAD) | tail -n1 | xargs git checkout
}

function git-prev() {
    git checkout HEAD^1
}

function tab-date(){
    autoload -U compinit
    compinit
    zstyle ':completion:*' file-sort modification
}
function tab-date-r(){
    autoload -U compinit
    compinit
    zstyle ':completion:*' file-sort modification reverse
}

proxy(){
    export https_proxy=$1
    export http_proxy=$1
    echo "proxy is set to $1"
}
unproxy(){
    unset https_proxy
    unset http_proxy
    echo "proxy is unset"
}

function ranger-cd() {
    tmpfile="/tmp/pwd-from-ranger";
    ranger --choosedir=$tmpfile;
    rangerpwd=$(cat $tmpfile);
    if [ "$PWD" != $rangerpwd ];then
        cd $rangerpwd;
    if [ "$PWD" != $rangerpwd ];then
        \\cd $rangerpwd;
    fi
    fi
}

function mcd(){
    mkdir -p $1 && cd $1
}


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

if (( $+commands[keychain] ));then
    [ -z "$HOSTNAME" ] && HOSTNAME=`uname -n`
    [[ -f $HOME/.keychain/$HOSTNAME-sh ]] && source $HOME/.keychain/$HOSTNAME-sh
    [[ -f $HOME/.ssh/id_ed25519 ]] && keychain $HOME/.ssh/id_ed25519 2>/dev/null
fi

### Fix slowness of pastes with zsh-syntax-highlighting.zsh
pasteinit() {
  OLD_SELF_INSERT=${${(s.:.)widgets[self-insert]}[2,3]}
  zle -N self-insert url-quote-magic # I wonder if you'd need `.url-quote-magic`?
}

pastefinish() {
  zle -N self-insert $OLD_SELF_INSERT
}
zstyle :bracketed-paste-magic paste-init pasteinit
zstyle :bracketed-paste-magic paste-finish pastefinish
### Fix slowness of pastes


# tmux alias
alias tkwo='tmux kill-window -a'
alias tkpo='tmux kill-pane -a'
