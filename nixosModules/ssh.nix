{ lib, config, ...}:

{
  options = {
    sshPort22 = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = false;
      };
    };
  };


  config = lib.mkIf config.sshPort22.enable 
  { 
    # Enabling the ssh daemon and opening port 22  
    services.openssh = {
      enable = true;
      settings.PasswordAuthentication = true;
      ports = [22];
    };
      
    networking.firewall.allowedTCPPorts = [ 22 ];
  };
}
