{ pkgs, lib, config, ... }:


{
  options.useKitty = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "config kitty terminal for hyprland";
    };
  };


  config = lib.mkIf config.useKitty.enable 
  {
    programs.kitty = {
      enable = true;
      theme = "Catppuccin-Mocha";
      extraConfig = "
        background_opacity 0.5
        map ctrl+alt+enter launch --cwd=current
        cursor_shape block
        window_margin_width 2
      ";
    };
  };
}
