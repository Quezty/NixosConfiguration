{ inputs, pkgs, ...}:
let
 input = inputs.nixpkgs.legacyPackages.${pkgs.system}; 
in
{
  options = {
    hyprlandMod.enable = {
      lib.mkEnableOption = "enables hyprlandMod";
      lib.mkDefault = true;
    };
  };

  config = 
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
      input.waybar
      input.hyprland
      input.wl-clipboard
      dunst
      libnotify
      swww
      hyprpaper
      input.hyprlock
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
