{ config, pkgs, ...}:

{
  # Enabling the ssh daemon and opening port 22  
  services.openssh = {
    enable = true;
    settings.PasswordAuthentication = false;
    ports = [22];
  };
  
  networking.firewall.allowedTCPPorts = [ 22 ];
}
