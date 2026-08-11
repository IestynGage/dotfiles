# .dotfiles

My dotfiles, used to configure git, vim and bash.
This dotfile repository is managed with [chezmoi](https://www.chezmoi.io/).

## Usage

```sh
### New machine
$ sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply IestynGage
# Clones the repo into `~/.local/share/chezmoi` and applies it to `$HOME`

### Existing machine 
$ sh -c "$(curl -fsLS get.chezmoi.io)" -- init IestynGage
$ chezmoi diff
$ chezmoi apply


### Editing 
$ chezmoi cd
# cd'd you into the IestynGage dotfiles repository.

$ chezmoi apply .vimrc
$ chezmoi edit --apply ~/.vimrc
```
