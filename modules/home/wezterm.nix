{
  pkgs,
  lib,
  config,
  ...
}: {
  options.useWezterm = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enable Wezterm terminal emulator";
    };
  };

  config =
    lib.mkIf config.useWezterm.enable
    {
      programs = {
        wezterm.enable = true;
        zoxide.enable = true;
        fd.enable = true;
      };

      xdg.configFile."wezterm" = {
        source = ./wezterm;
        recursive = true;
      };
    };
}
