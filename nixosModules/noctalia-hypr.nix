{ pkgs, lib, config, inputs, ...}:

{
  options = {
    useHyprlandWithNoctalia = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = false; 
      }; 
    };
  };

  config = lib.mkIf config.useHyprlandWithNoctalia.enable 
  {
    programs.hyprland = {
      enable = true;
      xwayland.enable = true;
    };

    imports = [
      inputs.noctalia.nixosModules.default
    ];

    programs.noctalia-shell.enable = true;

    services.xserver = {
      enable = true;
    };

    services.displayManager.sddm.enable = true;
    environment.sessionVariables = {
      WLR_NO_HARDWARE_CURSORS = "1";

      NIXOS_OZONE_WL = "1";
    };

    environment.systemPackages = with pkgs; [
      playerctl
      
      wl-clipboard # Clipboard 
      grim # Take picture of screen or region selected by Slurp
      slurp # Select region of screen
      imv # View images in the terminal, supported in kitty
    ];

    hardware = {
      graphics.enable = true;
    };

    xdg.portal.enable = true;
    xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };
}
