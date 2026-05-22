{ pkgs, lib, config, ...}:
{
  options = {
    addKeyboard = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = true;
      };
    };
  };

  config = lib.mkIf config.addKeyboard.enable {
    environment.systemPackages = with pkgs; [
      vial
    ];

    services.udev = {
      packages = with pkgs; [
        qmk
        qmk-udev-rules
        qmk_hid
        via
        vial
      ];
    };

    hardware.keyboard.qmk.enable = true;
  };
}
