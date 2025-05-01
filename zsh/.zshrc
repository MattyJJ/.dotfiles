# =====================
# ZSH OPTIONS
# =====================

setopt AUTO_CD
setopt HIST_IGNORE_DUPS

# =====================
# ZNAP INSTALL + SETUP
# =====================

# Install znap if it isn't already
if [[ ! -f ~/.zsh/plugins/znap/znap.zsh ]]; then
  mkdir -p ~/.zsh/plugins
  git clone https://github.com/marlonrichert/zsh-snap.git ~/.zsh/plugins/znap
fi

source ~/.zsh/plugins/znap/znap.zsh

# =====================
# OH-MY-ZSH INSTALL + SETUP
# =====================

# Install oh-my-zsh if it isn't already
# I'm doing this because I can't get--  
# the holy theme (robby russell) workin in znap
if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
  echo "Oh My Zsh is not installed. Installing..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

export ZSH="$HOME/.oh-my-zsh"

DISABLE_AUTO_UPDATE="true"
DISABLE_MAGIC_FUNCTIONS="true"
DISABLE_COMPFIX="true"

ZSH_THEME="robbyrussell"

source $ZSH/oh-my-zsh.sh

# ====================
# OPTIONS
# ====================

export EDITOR=nvim
export TERMINAL=alacritty

# ====================
# ALIASES
# ====================

alias ll="ls -la"
alias la="ls -a"
alias src="source ~/.zshrc"

# =====================
# PATH SETUP
# =====================

# ASDF Setup (Super version manager)
export ASDF_DATA_DIR="$HOME/.config/asdf"
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"
eval "$(asdf completion zsh)"

# =====================
# PLUGINS
# =====================

autoload -Uz compinit
# Slight performance boost
if [ "$(date +'%j')" != "$(stat -f '%Sm' -t '%j' ~/.zcompdump 2>/dev/null)" ]; then
    compinit
else
    compinit -C
fi

autoload -Uz znap && znap source marlonrichert/zsh-snap

znap source romkatv/zsh-defer

zsh-defer znap source zsh-users/zsh-autosuggestions 
zsh-defer znap source zsh-users/zsh-completions 
zsh-defer znap source zsh-users/zsh-syntax-highlighting 

zstyle ':completion:*' menu select

if [ -z "$TMUX" ] && [ -z "$ZSH_TMUX_AUTO" ]; then
  export ZSH_TMUX_AUTO=1
  exec tmux
fi
