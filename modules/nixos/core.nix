{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    generalPackages = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = true;
      };
    };
  };

  config =
    lib.mkIf config.generalPackages.enable
    {
      environment.systemPackages = with pkgs; [
        vesktop
        firefox
        spotify
        obsidian
        vlc
        pavucontrol
        home-manager
        thunar
        killall
        _1password-gui
      ];
    };
}
