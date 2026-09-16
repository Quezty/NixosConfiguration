<h1 align="center">Quezty's NixOS Configuration!</h1>

### The idea behind the configuration

What I want to achieve with this config is to have separate configs for my systems. In addition, I want to have a modular system so I can add and remove modules on the fly as my needs for that system differs.

### How it works

The configuration is built as a flake with per-host definitions. Each host has its own `configuration.nix` and `home.nix`, while shared functionality lives in toggle-able modules under `modules/`.

The current options to rebuild are:

`sudo nixos-rebuild switch --flake .#riven` (desktop, Nvidia + Hyprland) <br>
`sudo nixos-rebuild switch --flake .#antiopedee` (laptop, Hyprland) <br>

The rebuild options are the hostname that each system has. The names are for now meant to be Destiny 2 references.
Riven is my main workstation and got its name from it managing to do what I want it, but in an inconvenient or annoying way.
Antiopedee is an old laptop of mine that I have mostly used to code on the go and has served me well. Hence it got the name of my ol' reliable in Destiny, Antiope-D

### Structure

```
.
├── flake.nix                   # Flake entry point
├── hosts/
│   ├── riven/                  # Desktop (Nvidia, Hyprland, gaming)
│   │   ├── configuration.nix
│   │   ├── home.nix
│   │   └── hardware-configuration.nix
│   └── laptop/
│       ├── configuration.nix
│       ├── home.nix
│       └── hardware-configuration.nix
├── modules/
│   ├── nixos/                  # System-level modules
│   │   ├── core.nix            # General packages (Firefox, Obsidian, etc.)
│   │   ├── hyprland.nix
│   │   ├── sound.nix
│   │   ├── gaming.nix          # Steam
│   │   ├── dev.nix
│   │   ├── distrobox.nix
│   │   ├── ssh.nix
│   │   ├── adguard.nix
│   │   ├── bluetooth.nix
│   │   ├── keyboard.nix
│   │   ├── tmux.nix
│   │   └── zsh.nix
│   └── home/                   # Home Manager modules
│       ├── neovim.nix
│       ├── wezterm.nix
│       ├── kitty.nix
│       ├── git.nix
│       └── zsh.nix
```

### Modules

Modules are toggle-able via `enable` options in each host's `configuration.nix` and `home.nix`. For example, `riven` enables Hyprland, gaming, and Neovim. This makes it easy to tailor each host without duplicating configuration.
