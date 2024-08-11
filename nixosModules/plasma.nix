{ pkgs, config, lib,  ...}:
{
  options = {
    useKDEPlasma = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = false; 
      }; 
    };
  };

  config = lib.mkIf config.useKDEPlasma.enable 
  {
    services = {
      xserver.enable = true;
      displayManager.sddm.enable = true;
      xserver.desktopManager.plasma5.enable = true;
    };

    environment.plasma5.excludePackages = with pkgs.kdePackages; [
      konsole
      plasma-browser-integration
    ];
  };
}
