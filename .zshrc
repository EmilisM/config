# Set path if required
#export PATH=$GOPATH/bin:/usr/local/go/bin:$PATH

export EDITOR="/opt/nvim-linux-x86_64/bin/nvim"

# Aliases
alias ls='ls --color=auto'
alias ll='ls -lah --color=auto'
alias grep='grep --color=auto'

alias wake-amethyst='sudo etherwake E8:6A:64:BF:BF:9E'

# Editing alises
alias edit-zsh="$EDITOR $HOME/.zshrc" # edit .zshrc
alias reload-zsh="source $HOME/.zshrc"  # reload zsh configuration
alias edit-alacritty="$EDITOR $HOME/.config/alacritty/alacritty.toml"
alias edit-starship="$EDITOR $HOME/.config/starship.toml"
alias edit-configs="$EDITOR $HOME/.config"

alias dotfiles='git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME"'
  
setopt histignorealldups sharehistory

bindkey "^[[3;3~" delete-word
bindkey "^[^?" backward-delete-word

HISTSIZE=5000
SAVEHIST=5000
HISTFILE=~/.zsh_history

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk

zinit snippet OMZL::git.zsh
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::command-not-found
zinit load "zsh-users/zsh-syntax-highlighting"
zinit load "zsh-users/zsh-autosuggestions"
zinit load "zsh-users/zsh-history-substring-search"
zinit load "zsh-users/zsh-completions"

eval "$(starship init zsh)"

# fnm
FNM_PATH="/home/emilis/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="/home/emilis/.local/share/fnm:$PATH"
  eval "`fnm env`"
fi

export PATH="$PATH:/opt/nvim-linux-x86_64/bin"

# pnpm
export PNPM_HOME="/home/emilis/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
