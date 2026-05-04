{ pkgs, lib, config, ...}:

{
  options = {
    useNiri = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = false; 
      }; 
    };
  };

  config = lib.mkIf config.useNiri.enable 
  {
    programs.niri = {
      enable = true;
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
    ];

    hardware = {
      graphics.enable = true;
    };

    xdg.portal.enable = true;
    xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };
}
