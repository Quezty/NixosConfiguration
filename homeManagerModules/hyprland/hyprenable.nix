{ lib, config, ...}:

{
  options.hyprconfig = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enable configuration for hyprland and other programs from the hypr eco-system";
    };
  };

  config = lib.mkIf config.hyprconfig.enable 
  {
    import = [
      ./misc.nix
      ./binds.nix
      ./monitors.nix
    ];

    wayland.windowManager.hyprland.enable = true;
  };
}
