{ pkgs, lib, config, ...}: 
{
  options = {
    addDistrobox = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = false;
      };
    };
  };

  config = lib.mkIf config.addDistrobox.enable 
  {
    environment.systemPackages = with pkgs; [
      podman
      distrobox
    ];
    virtualisation.podman.enable = true;
  };
}
