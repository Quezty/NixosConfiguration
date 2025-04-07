{ pkgs, lib, config, ...}: 
{
  options = {
    generalPackages = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = true;
      };
    };
  };

  config = lib.mkIf config.generalPackages.enable 
  {
    environment.systemPackages = with pkgs; [
      vesktop
      ventoy-full
      firefox
      spotify
      obsidian
      vlc
      wl-clipboard
      pavucontrol
      home-manager
      xfce.thunar
      killall
      _1password-gui
      unetbootin
    ];
  };
}
