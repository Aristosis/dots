# System configuration collection
System configuration files that have been toyed with over a few years, feel free to copy.
The only nightly software I use is `neovim`. Everything else can be found on the native package repositories or AUR.

the pkglist is completely improvised via a command btw please try doing it on your own unless you want 100 other garbage packages you dont need (i think)

## Setup
```bash
# clone this repository
git clone https://github.com/aristosis/dots 

cd dots

# Download all required packages
sudo pacman -S pkglist

# Use stow to create links, or just
  copy the config files to ~/.config/
stow ./*
```

`stow` might fail because conflicting config files already exist; try removing them or doing `stow --adopt` to adopt any present files.
