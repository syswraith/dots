# dots

Personal Sway/Wayland setup.

## Bootstrap

Clone the repo and stow it from the repo root:

```sh
git clone https://github.com/syswraith/dots.git ~/dots
cd ~/dots
stow . --adopt
```

`--adopt` imports/overwrites existing conflicting files into the repo.

## Arch repository packages

```sh
sudo pacman -S --needed \
  stow \
  sway swayidle swaylock \
  waybar fuzzel mako wlogout wofi \
  grim slurp wl-clipboard \
  brightnessctl pavucontrol \
  pipewire wireplumber \
  xdg-desktop-portal xdg-desktop-portal-gtk \
  alacritty neovim tmux yazi mpv \
  bat fzf zoxide \
  git github-cli \
  python go gcc perl gdb \
  nethack \
  glib2 xdg-utils java-runtime-common \
  ttf-jetbrains-mono-nerd
```

## AUR packages

```sh
yay -S --needed \
  wallust \
  helium-browser-bin \
  envman \
  gf2
```

## Plugin-managed extras

- Neovim plugins are installed through Lazy; Mason provides `lua_ls`, `gopls`, `pyright`, `ts_ls`, and `clangd`.
- tmux plugins are managed by tpm.
- Yazi uses the `gruvbox-material` flavor from `package.toml`.
