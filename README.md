# My dotfiles
This repo inculdes my whole system configuration. 
I tried to pack as much as I can into home manager for portability.

## Usage

### For nixos:
- Clone this repo (you probably want to use `nix-shell -p git` on a fresh system) and `cd` into it,
- Run `cp /etc/nixos/hardware-configuration.nix .`,
- Run `nixos rebuild-switch --flake .#default`,
- Reboot
