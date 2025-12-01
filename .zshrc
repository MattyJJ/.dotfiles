# SOURCE

source ~/.zsh_aliases 

# OPTIONS

setopt AUTO_CD
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS

# DEFER

defer_plugin="romkatv/zsh-defer"
defer_dir="$HOME/.zsh/plugins/$defer_plugin"

if [ ! -d "$defer_dir" ]; then
    mkdir -p "$(dirname "$defer_dir")"
    git clone "https://github.com/$defer_plugin.git" "$defer_dir"
fi
source "$defer_dir/zsh-defer.plugin.zsh"

# COMPLETION

fpath=(${ASDF_DATA_DIR:-$HOME/.asdf}/completions $fpath)

autoload -Uz compinit
if [ "$(date +'%j')" != "$(stat -f '%Sm' -t '%j' ~/.zcompdump 2>/dev/null)" ]; then
    zsh-defer -t 0.1 compinit
else
    zsh-defer -t 0.1 compinit -C
fi

# TOOLS
zsh-defer eval "$(atuin init zsh --disable-up-arrow)"

# PLUGINS

git_plugins=(
    zsh-users/zsh-autosuggestions
    zsh-users/zsh-completions
    zsh-users/zsh-syntax-highlighting
)

for plugin in "${git_plugins[@]}"; do
    plugin_dir="$HOME/.zsh/plugins/$plugin"

    if [ ! -d "$plugin_dir" ]; then
        mkdir -p "$(dirname "$plugin_dir")"
        git clone "https://github.com/$plugin.git" "$plugin_dir"
    fi

    plugin_name="${plugin##*/}"
    plugin_file="$plugin_dir/$plugin_name.zsh"
    if [ -f "$plugin_file" ]; then
        zsh-defer source "$plugin_file"
    fi

done


# SSH

if [ -z "$SSH_AUTH_SOCK" ]; then
    eval "$(ssh-agent -s)" > /dev/null
    ssh-add ~/.ssh/id_ed25519 2>/dev/null
fi

# TMUX

if command -v tmux >/dev/null 2>&1; then
    if [ -z "$TMUX" ]; then
        exec tmux
    fi
fi

# prompt
eval "$(starship init zsh)"
