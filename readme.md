<h1 align="center">Quezty's NixOS Configuration!</h1>

### The idea behind the configuration

What I want to achieve with this config is to be able to have separate configs for separate units that I have. In addition, I want to have a modular system so I can add and remove modules on the fly as my needs for that unit differs.

### How it works (Current state)
I have used a flake to be able to build from the different host folders. The current options to rebuild are:
```sudo nixos-rebuild switch --flake .#desktop```
and
```sudo nixos-rebuild switch --flake .#laptop```
