# dotfiles
:dna: This is me :dna:


Following the setup as outlined [here](https://www.atlassian.com/git/tutorials/dotfiles)

TODO: 

```
  curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
- [ ] throw this in an executable
- [ ] Update the references to home directories to be more modular
- [ ] Add links to getting git set up on machines
- [ ] Check out nvim 0.5, and do cool lua stuffs


## To get started
- [ ] install [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh)
- [ ] install [powerlevel10k](https://github.com/romkatv/powerlevel10k#manual)
- [ ] install [vim](https://github.com/neovim/neovim/wiki/Installing-Neovim)
- [ ] install [vim-plugged](https://github.com/junegunn/vim-plug#installation)

Paste this bad boy in the console to get started (WIP):
```
git clone --bare https://github.com/chrisgrovers/dotfiles.git $HOME/.dotfiles
function config {
   /usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME $@
}
mkdir -p .config-backup
config checkout
if [ $? = 0 ]; then
  echo "Checked out config.";
  else
    echo "Backing up pre-existing dot files.";
    config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .config-backup/{}
fi;
config checkout

```
