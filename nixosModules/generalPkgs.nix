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
      discord
      ventoy-full
      firefox
      spotify
      obsidian
    ];
  };
}