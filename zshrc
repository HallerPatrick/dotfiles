  
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:$HOME/Temp/flutter/bin

export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
export WORKON_HOME=~/.venvs

source virtualenvwrapper.sh

export DARTSDK=$HOME/Temp/flutter/bin

## cd on steroids
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh


#if (( $+commands[setxkbmap] )) ; then

#    # Only apply to linux systems
#    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
#        echo "\e[32mLoad US Keyboard Layout \e[0m"
#        setxkbmap us
#    fi
#fi


## # Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

## Set name of the theme to load. Optionally, if you set this to "random"
## it'll load a random theme each time that oh-my-zsh is loaded.
## See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="powerlevel10k/powerlevel10k"

## Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

## Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

## Uncomment the following line if you want to disable marking untracked files
## under VCS as dirty. This makes repository status check for large repositories
## much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

## Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
## Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
## Example format: plugins=(rails git textmate ruby lighthouse)
## Add wisely, as too many plugins slow down shell startup.
plugins=(
  zsh-autosuggestions
  web-search
)

if [[ -f $ZSH/oh-my-zsh.sh ]]; then
    echo '\e[32mLoad ohmyzsh \e[0m'
    source $ZSH/oh-my-zsh.sh
else
    echo "\e[31mohmyzsh not found \e[0m"
fi

#[[ -s "$HOME/.local/share/marker/marker.sh" ]] && source "$HOME/.local/share/marker/marker.sh"

## User configuration
#export MANPATH="/usr/local/man:$MANPATH"

## ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

## You may need to manually set your language environment
export LANG=en_US.UTF-8

## Preferred editor for local and remote sessions
export EDITOR='nvim'

## Git token for hub

#if [[ -f $HOME/.github_token ]]
#then
#    export GITHUB_TOKEN=$(cat $HOME/.github_token)
#fi
#export GITLAB_API_ENDPOINT="https://gitlab.com/api/v3"
#export CODECOV_TOKE="af5b5141-3baf-474e-aaf8-8592e916b921"


## Set personal aliases, overriding those provided by oh-my-zsh libs,
## plugins, and themes. Aliases can be placed here, though oh-my-zsh
## users are encouraged to define aliases within the ZSH_CUSTOM folder.
## For a full list of active aliases, run `alias`.
##

## Aliases
if [ -f ~/.bash_aliases ]; then
    echo "\e[32mLoad bash aliases \e[0m"
    source ~/.bash_aliases
else
    echo "\e[31mbash aliases not found \e[0m"
fi

## ENV VARS
##

#export RUSTPYTHONPATH="/Users/patrickhaller/Temp/RustPython/Lib"
#export HOMEBREW_EDITOR='vim'

## Flutter
#export PATH="$HOME/development/flutter/bin:$PATH"

## Latex Tools
#export PATH="/Library/TeX/texbin/:$PATH"

## Rust
#export PATH="$HOME/.cargo/bin:$PATH"
#export PATH="/usr/local/opt/texinfo/bin:$PATH"

#export RUST_BACKTRACE=1

## Python
#export PATH="$HOME/Library/Python/3.7/bin:$PATH"

#export PATH="$HOME/.poetry/bin:$PATH"

## Golang
#export GOPATH=~/gospace
#export GOROOT=/usr/local/go
#export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"
#test -d "${GOPATH}" || mkdir "${GOPATH}"
#test -d "${GOPATH}/src/github.com" || mkdir -p "${GOPATH}/src/github.com"

#export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
#export PATH="$HOME/.cargo/bin:$PATH"

#export ENABLE_FLUTTER_DESKTOP=true

#export PATH="/Users/patrickhaller/.dotnet/:$PATH"

#export PATH="/Users/patrickhaller/.pyenv/bin:$PATH"
#export PATH="/usr/local/bin:$PATH"

#eval "$(pyenv init -)"
#eval "$(pyenv virtualenv-init -)"

#export CPPFLAGS="-I/usr/local/opt/zlib/include"
#export LDFLAGS="-L$(brew --prefix zlib)/lib -L$(brew --prefix sqlite)/lib -L$(brew --prefix bzip2)/lib"

#cd() { builtin cd "$@"; ls; }               # Always list directory contents upon 'cd'


#extract () {
#    if [ -f $1 ] ; then
#      case $1 in
#        *.tar.bz2)   tar xjf $1     ;;
#        *.tar.gz)    tar xzf $1     ;;
#        *.bz2)       bunzip2 $1     ;;
#        *.rar)       unrar e $1     ;;
#        *.gz)        gunzip $1      ;;
#        *.tar)       tar xf $1      ;;
#        *.tbz2)      tar xjf $1     ;;
#        *.tgz)       tar xzf $1     ;;
#        *.zip)       unzip $1       ;;
#        *.Z)         uncompress $1  ;;
#        *.7z)        7z x $1        ;;
#        *)     echo "'$1' cannot be extracted via extract()" ;;
#         esac
#     else
#         echo "'$1' is not a valid file"
#     fi
#}

#fancy-ctrl-z () {
#  if [[ $#BUFFER -eq 0 ]]; then
#    BUFFER="fg"
#    zle accept-line
#  else
#    zle push-input
#    zle clear-screen
#  fi
#}
#zle -N fancy-ctrl-z
#bindkey '^Z' fancy-ctrl-z


#[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

## To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh
autoload -U promptinit; promptinit
prompt pure

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/bit bit

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/patrickhaller/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/patrickhaller/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/patrickhaller/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/patrickhaller/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


alias luamake=/Users/patrickhaller/.config/nvim/lua-language-server/3rd/luamake/luamake
