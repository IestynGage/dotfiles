# .dotfiles

My dotfiles, managed with [chezmoi](https://www.chezmoi.io/).

## Usage

### New machine

Install [chezmoi](https://www.chezmoi.io/install/), then bootstrap in one step:

    sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply IestynGage

This clones the repo into `~/.local/share/chezmoi` and applies it to `$HOME`.

### Existing machine

Pull the latest changes and apply them:

    chezmoi update

Preview what would change before applying:

    chezmoi diff

### Editing

Edit a managed file and reapply in one step:

    chezmoi edit --apply ~/.vimrc

Or edit the source directly:

    chezmoi cd
