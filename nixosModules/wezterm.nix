{ pkgs, lib, config, ... }:
{
  options = {
    useWezterm = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = true; 
      }; 
    };
  };

  config = lib.mkIf config.hyprlandMod.enable 
  {
    programs.wezterm = {
      enable = true;
      extraConfig = ''
        return {
          color_scheme = "nord"
          hide_tab_bar_if_only_one_tab = true
          window_background_opacity = 0.5
        }
      '';
    };
  };
    
}