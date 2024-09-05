{ lib, config, ...}:

{
  wayland.windowManager.hyprland.extraConfig = ''
    source = ~/repos/NixosConfiguration/homeManagerModules/hyprland/hyprland.conf
  '';
}
