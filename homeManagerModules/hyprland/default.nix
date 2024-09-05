{ lib, config, ...}:

{
  imports = [
    ./sourcing.nix
  ];

  wayland.windowManager.hyprland.enable = true;
}
