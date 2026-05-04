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
      firefox
      spotify
      obsidian
      vlc
      wl-clipboard
      pavucontrol
      home-manager
      killall
      _1password-gui
      unetbootin
      vial
    ];
    services.udev = {
      packages = with pkgs; [
        qmk
        qmk-udev-rules # the only relevant
        qmk_hid
        via
        vial
      ]; # packages

    };

    hardware.keyboard.qmk.enable = true;

    services.udev.extraRules = ''
      KERNEL=="hidraw*", SUBSYSTEM=="hidraw", ATTRS{idVendor}=="4653", ATTRS{idProduct}=="0004", GROUP="users", MODE="0666"
    '';

  };
}
