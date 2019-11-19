export BASH_SILENCE_DEPRECATION_WARNING=1 # supress zsh warnings

export PS1='\u:\[\e[36m\]\w\[\e[0m\]\$ '

export EDITOR='vim'

# Aliases
alias ls='ls -G'
#alias vi='nvim'

# Path
export PATH="/usr/local/opt/ruby/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="/usr/local/opt/llvm/bin:$PATH"
export GOROOT="/usr/local/go"
export GOPATH="$HOME/go-workspace"
export PATH=$GOPATH/bin:$PATH
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
