{ pkgs, lib, config, ...}:
{
  options = {
    adGuard = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = false;
      };
    };
  };

  config = lib.mkIf config.adGuard.enable
  {
    networking = {
      firewall = {
        allowedTCPPorts = [ 3333 3000 80 ];
        allowedUDPPorts = [ 53 ];
      };
      nameservers = [ "127.0.0.1" ];
    };

    services = {
      adguardhome = {
        enable = true;
        openFirewall = true;
        port = 3333;
      };
    };
  };
}
