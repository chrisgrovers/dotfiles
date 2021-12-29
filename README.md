# dotfiles
:dna: This is me :dna:


Following the setup as outlined [here](https://www.atlassian.com/git/tutorials/dotfiles)

TODO: 
- [ ] Check out TMUX
- [ ] Check out nvim 0.5, and do cool lua stuffs
- [ ] i3blocks:
  - [ ] Fix fonts not displaying
  - [ ] Split configs into desktop and laptop (potentially differnt branches)

## For linux/i3
- [Install Rofi](https://github.com/davatorium/rofi/blob/next/INSTALL.md#install-a-checkout-from-git)
- [Install i3blocks](https://github.com/vivien/i3blocks)
- [icons](https://snwh.org/moka/download)

## To get started
- [ ] [install oh-my-zsh](https://ohmyz.sh/#install)
- [ ] [install powerlevel10k](https://github.com/romkatv/powerlevel10k#oh-my-zsh)
- [ ] [install neovim](https://github.com/neovim/neovim/wiki/Installing-Neovim)
- [ ] [install vim-plugged](https://github.com/junegunn/vim-plug#installation)
- [ ] [install ripgrep](https://github.com/BurntSushi/ripgrep#installation)
- [ ] [install prettier globally](https://github.com/prettier/prettier)


Paste this bad boy in the console to get started (WIP):
```
git clone --bare git@github.com:chrisgrovers/dotfiles.git $HOME/.dotfiles
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

- [ ] After setting up, configure git following [this guide](https://docs.github.com/en/github/authenticating-to-github/creating-a-personal-access-token)
- [ ] paste `git config --global credential.helper store` to store the newly generated access token
