if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    command mkdir -p $HOME/.zinit
    command git clone https://github.com/zdharma-continuum/zinit.git $HOME/.zinit/bin
fi

[[ ! -f ~/.zinit/bin/zinit.zsh ]] || source ~/.zinit/bin/zinit.zsh
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

setopt autocd extendedglob nomatch notify appendhistory sharehistory incappendhistory HIST_IGNORE_SPACE COMPLETE_ALIASES
unsetopt beep
bindkey -e
autoload -Uz compinit promptinit bashcompinit
compinit
promptinit
bashcompinit
zstyle :compinstall filename '$HOME/.zshrc'

if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    command mkdir -p $HOME/.zinit
    command git clone https://github.com/zdharma-continuum/zinit.git $HOME/.zinit/bin
fi

[[ ! -f /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme ]] || source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/aliases/aliases ]] || source ~/aliases/aliases
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

neofetch --config ~/.config/neofetch/config.conf

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Gray color for autosuggestions
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=247'

# fzf settings. Uses sharkdp/fd for a faster alternative to `find`.
FZF_CTRL_T_COMMAND='fd --type f --hidden --exclude .git --exclude .cache'
FZF_ALT_C_COMMAND='fd --type d --hidden --exclude .git'

# Load plugins
zinit load "woefe/wbase.zsh"
zinit load "woefe/git-prompt.zsh"
zinit load "zsh-users/zsh-completions"
zinit load "zsh-users/zsh-autosuggestions"
zinit load "zsh-users/zsh-syntax-highlighting"
zinit load "zsh-users/zsh-history-substring-search"
zinit load "MichaelAquilina/zsh-you-should-use"

# Keybindings for substring search plugin. Maps up and down arrows.
bindkey -M main '^[OA' history-substring-search-up
bindkey -M main '^[OB' history-substring-search-down
bindkey -M main '^[[A' history-substring-search-up
bindkey -M main '^[[B' history-substring-search-up

# Keybindings for autosuggestions plugin
bindkey '^ ' autosuggest-accept
bindkey '^f' autosuggest-accept

export PATH="/home/anon/.local/bin:/home/anon/go/bin:$PATH"
