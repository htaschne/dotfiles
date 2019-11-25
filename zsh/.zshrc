
# ZSH intallation path
export ZSH="/Users/william/.oh-my-zsh"

# ZSH THEME
ZSH_THEME="Predawn"

# PLUGINS
plugins=(git)

zstyle ':prezto:module:prompt' theme 'predawn'

export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh
zplug jamiewilson/predawn-shell, as:theme

# NO IDEA
source $ZSH/oh-my-zsh.sh

# PATH

