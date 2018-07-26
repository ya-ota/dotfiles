export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

HISTFILE=$HOME/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

zplug "yous/vanilli.sh"

# Load the theme.
#zplug "yous/lime", as:theme
#export LIME_DIR_DISPLAY_COMPONENTS=2
#zplug 'dracula/zsh', as:theme
zplug mafredri/zsh-async, from:github
zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme


# Make sure to use double quotes
zplug "zsh-users/zsh-history-substring-search"

# Use the package as a command
# And accept glob patterns (e.g., brace, wildcard, ...)
zplug "Jxck/dotfiles", as:command, use:"bin/{histuniq,color}"

# Can manage everything e.g., other person's zshrc
zplug "tcnksm/docker-alias", use:zshrc

# Supports oh-my-zsh plugins and the like
zplug "plugins/git",   from:oh-my-zsh

# Also prezto
zplug "modules/prompt", from:prezto

# Load if "if" tag returns true
zplug "lib/clipboard", from:oh-my-zsh, if:"[[ $OSTYPE == *darwin* ]]"

# Group dependencies
# Load "emoji-cli" if "jq" is installed in this example
zplug "stedolan/jq", from:gh-r, as:command, rename-to:jq
zplug "b4b4r07/emoji-cli", on:"stedolan/jq"

# Note: To specify the order in which packages should be loaded, use the defer
#       tag described in the next section

# Set the priority when loading
# e.g., zsh-syntax-highlighting must be loaded
# after executing compinit command and sourcing other plugins
# (If the defer tag is given 2 or above, run after compinit command)
zplug "zsh-users/zsh-syntax-highlighting", defer:2

# Can manage local plugins
#zplug "~/.zsh", from:local

#  typing support
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "chrissicool/zsh-256color"

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load
#zplug load --verbose

#for golang
export GOPATH=$HOME/dev
export PATH=$PATH:$GOPATH/bin

#for fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git"'
export FZF_DEFAULT_OPTS='--height 40% --reverse --border'

bindkey '^]' peco-src
function peco-src() {
  local src=$(ghq list --full-path | peco --query "$LBUFFER")
  if [ -n "$src" ]; then
    BUFFER="cd $src"
    zle accept-line
  fi
  zle -R -c
}
zle -N peco-src

function peco-history-selection() {
	BUFFER=`history -n 1 | tail -r  | awk '!a[$0]++' | peco`
		CURSOR=$#BUFFER
		zle reset-prompt
}
zle -N peco-history-selection
bindkey '^R' peco-history-selection

autoload -U promptinit; promptinit
# optionally define some options
PURE_CMD_MAX_EXEC_TIME=10
prompt pure
