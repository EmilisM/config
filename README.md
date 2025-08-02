# Config

## Init

- `git init --bare ~/.dotfiles`
- `alias dotfiles='git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME"'`
    - Make it permanent in .zshrc or .bashrc
- `dotfiles config status.showUntrackedFiles no`

## Clone

- `git clone --bare <git-repo-url> $HOME/.dotfiles`
- `alias dotfiles='git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME"'`
    - Make it permanent in .zshrc or .bashrc
- `dotfiles checkout`
- `dotfiles config --local status.showUntrackedFiles no`
