setopt AUTO_CD
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS


if [[ ! -d ~/.zsh/plugins/znap ]]; then
	mkdir -p ~/.zsh/plugins  
	git clone https://github.com/marlonrichert/zsh-snap.git ~/.zsh/plugins/znap
fi
source ~/.zsh/plugins/znap/znap.zsh


alias ll="ls -la"
alias la="ls -a"
alias zsrc="source ~/.zshrc"

# to preserve user path, for example to use language binaries managed by asdf
alias sudo="sudo -E"

# AUTO COMPLETIONS

fpath=(${ASDF_DATA_DIR:-$HOME/.asdf}/completions $fpath)
autoload -Uz compinit
if [ "$(date +'%j')" != "$(stat -f '%Sm' -t '%j' ~/.zcompdump 2>/dev/null)" ]; then
    compinit
else
    compinit -C
fi

# ATUIN (Very nice command history.)
eval "$(atuin init zsh --disable-up-arrow)"

# THEME (starship)
eval "$(starship init zsh)"

# PLUGINS

autoload -Uz znap && znap source marlonrichert/zsh-snap

znap source romkatv/zsh-defer

git_plugins=(
    zsh-users/zsh-autosuggestions
    zsh-users/zsh-completions
    zsh-users/zsh-syntax-highlighting
)

for plugin in "${git_plugins[@]}"; do 
    zsh-defer znap source "$plugin"
done

zstyle ':completion:*' menu select

# SSH

if [ -z "$SSH_AUTH_SOCK" ] || ! pgrep -u "$USER" ssh-agent >/dev/null 2>&1; then
    eval "$(ssh-agent -s)" >/dev/null 2>&1
fi

ssh-add -l | grep "id_ed25519" >/dev/null 2>&1 || ssh-add ~/.ssh/id_ed25519 >/dev/null 2>&1

# TMUX

if command -v tmux >/dev/null 2>&1; then
    if [ -z "$TMUX" ]; then
        exec tmux
    fi
fi
