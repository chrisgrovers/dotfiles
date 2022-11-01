[#](#) dotfiles
:dna: This is me :dna:

Following the setup as outlined [here](https://www.atlassian.com/git/tutorials/dotfiles)

## To get started
- [ ] [install git(linux only)](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
- [ ] [install prettier globally](https://github.com/prettier/prettier)

## For linux/i3
- [icons](https://snwh.org/moka/download)

## For MacOS
- [Do the thing]

Paste this bad boy (Either SSH or HTTPS) in the console to get started:
SSH:
```
git clone --bare git@github.com:chrisgrovers/dotfiles.git $HOME/.dotfiles
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
config checkout -f
bash chris.sh

```
HTTPS:
```
git clone --bare https://github.com/chrisgrovers/dotfiles.git $HOME/.dotfiles
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
config checkout -f
bash chris.sh
```


- [ ] After setting up, configure git following [this guide](https://docs.github.com/en/github/authenticating-to-github/creating-a-personal-access-token)
- [ ] paste `git config --global credential.helper store` to store the newly generated access token
