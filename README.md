# dotfiles

Uses the approach described [here](https://news.ycombinator.com/item?id=11070797) to avoid having a `$HOME/.git` directory:


    git init --bare $HOME/.myconf
    alias config='/usr/bin/git --git-dir=$HOME/.myconf/ --work-tree=$HOME'
    config config status.showUntrackedFiles no
    
Now `cd $HOME`, and use `config` instead of `git`, i.e., `config status`, `config add $filename`, `config commit` or `config push`.
