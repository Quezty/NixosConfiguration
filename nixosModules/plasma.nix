{
  pkgs,
  config,
  lib,
  ...
}: {
  options = {
    useKDEPlasma = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = false;
      };
    };
  };

  config =
    lib.mkIf config.useKDEPlasma.enable
    {
      services = {
        xserver.enable = true;
        displayManager.sddm.enable = true;
        xserver.desktopManager.plasma.enable = true;
      };

      environment.plasma.excludePackages = with pkgs.kdePackages; [
        konsole
        plasma-browser-integration
      ];
    };
}
