{ pkgs, lib, config, ...}:

{
  options = {
    useHyprland = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = true; 
      }; 
    };
  };

  config = lib.mkIf config.useHyprland.enable 
  {
    programs.hyprland = {
      enable = true;
      xwayland.enable = true;
    };

    services.xserver = {
      enable = true;
    };

    services.displayManager.sddm.enable = true;
    environment.sessionVariables = {
      WLR_NO_HARDWARE_CURSORS = "1";

      NIXOS_OZONE_WL = "1";
    };

    environment.systemPackages = with pkgs; [
      waybar
      hyprland
      wl-clipboard
      dunst
      libnotify
      swww
      hyprpaper
      hyprlock
      kitty
      rofi-wayland
      networkmanagerapplet
      grim
      slurp
      imv
    ];

    hardware = {
      graphics.enable = true;
    };

    xdg.portal.enable = true;
    xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };
}
