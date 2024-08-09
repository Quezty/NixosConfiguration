{ pkgs, lib, config, ...}: 
{
  options = {
    devPackages = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = false;
      };
    };
  };

  config = lib.mkIf config.devPackages.enable 
  {
    environment.systemPackages = with pkgs; [
      insomnia
      gh
      inetutils
      nmap
      vscode
    ];
  };
}
