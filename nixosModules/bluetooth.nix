{ lib, config, ...}:

{
  options = {
    addBluetooth = {
      enable = lib.mkOption  {
        type = lib.types.bool;
        default = true;
      };
    }; 
  };

  config = lib.mkIf config.addBluetooth.enable {
    hardware = {
      bluetooth = {
        enable = true;
        powerOnBoot = true;
      };
      pulseaudio.enable = true;
    };

    services.blueman.enable = true;
  };
}
