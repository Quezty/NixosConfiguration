<h1 align="center">Quezty's NixOS Configuration!</h1>

### The idea behind the configuration

What I want to achieve with this config is to have separate configs for my systems. In addition, I want to have a modular system so I can add and remove modules on the fly as my needs for that system differs.

### How it works (Current state)
I have used a flake to be able to build from the different host folders. The current options to rebuild are: <br>

`sudo nixos-rebuild switch --flake .#desktop` <br>
`sudo nixos-rebuild switch --flake .#laptop`  <br>

and soon <br>

`sudo nixos-rebuild switch --flake .#headless`

This is about the time where you're probably asking yourself, but what's the difference? The difference in the two options lay in which of my modules I have enabled on them by default. The laptop for example, uses hyprland, and the desktop uses plasma by default. The desktop version has added support for nvidia, the laptop option does not. Those are so far the main differences, but there will be more as my config grows and I tinker more with it.
