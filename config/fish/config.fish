# eval /Users/patrickhaller/opt/anaconda3/bin/conda "shell.fish" hook $argv | source
# 
# export PATH=$PATH:$HOME/.local/bin
# export PATH=$PATH:$HOME/Temp/flutter/bin
# export PATH=$PATH:/usr/local/opt/llvm/bin
# 
# export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
# export WORKON_HOME=~/.venvs
# export DARTSDK=$HOME/Temp/flutter/bin
# 
# 
# 
# source ~/.bash_aliases
# 
# export PATH={$PATH}:~/.local/share/nvim/lsp_servers
# export PATH={$PATH}:~/.nimble/bin
# export PATH={$PATH}:~/zls
# export PATH=/Library/Java/JavaVirtualMachines/jdk-11.0.13.jdk/Contents/Home/bin:{$PATH}
# 
# alias hh=hstr                    # hh to be alias for hstr
# setopt histignorespace           # skip cmds w/ leading space from history
# export HSTR_CONFIG=hicolor       # get more colors
# bindkey -s "\C-r" "\C-a hstr -- \C-j"     # bind hstr to Ctrl-r (for Vi mode check doc)

export EDITOR='nvim'

alias vim="nvim"
alias fishc="vim ~/.config/fish/config.fish"
alias ls="exa"
alias lsa="exa -la"
alias vimc="nvim ~/.config/nvim/lua"
alias home="cd ~"


function fish_user_key_bindings
    bind \cr 'peco_select_history (commandline -b)'
end

function peco_select_history
    if test (count $argv) = 0
        set peco_flags --layout=bottom-up
    else
        set peco_flags --layout=top-down --query "$argv"
    end

    history | peco $peco_flags | read foo

    if [ $foo ]
        commandline $foo
    else
        commandline ''
    end
end
