# .dotfiles

My dotfiles, used to configure git, vim and bash.
This dotfile repository is managed with [chezmoi](https://www.chezmoi.io/).

## Usage

```sh 
$ sh -c "$(curl -fsLS get.chezmoi.io)" -- init IestynGage
# Clones the repo into `~/.local/share/chezmoi` and applies it to `$HOME`
$ chezmoi edit-config
# Adds the configuration values needed, see ## config
$ chezmoi diff
$ chezmoi apply


### Editing 
$ chezmoi cd
# cd'd you into the IestynGage dotfiles repository.

$ chezmoi apply .vimrc
$ chezmoi edit --apply ~/.vimrc
```

## Config 

```
[data]
  git_name = ""
  git_email = ""
  git_default_branch = ""
  shells = [] # Decideds the shells. Allowed values 'bash' and 'zsh'
```