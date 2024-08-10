{ pkgs, lib, config, ... }:


{
  options.useWezterm = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enable Wezterm terminal emulator";
    };
  };


  config = lib.mkIf config.useWezterm.enable 
  {
    programs.wezterm = {
      enable = true;
      extraConfig = ''
        return {
          color_scheme = "rose-pine-moon",
          enable_wayland = false,
          hide_tab_bar_if_only_one_tab = true,
          window_background_opacity = 0.5,
          font = wezterm.font("JetBrainsMono Nerd Font", {weight="Bold", stretch="Normal", style="Normal"}),
          leader = {key="Space", mods = "CTRL", timeout_milliseconds = 1000},
          keys = {
            {key="v", mods="LEADER", action = wezterm.action.SplitVertical ({domain = "CurrentPaneDomain"})},
            {key="h", mods="LEADER", action = wezterm.action.SplitHorizontal ({domain = "CurrentPaneDomain"})},
            {key="c", mods="LEADER", action = wezterm.action.SpawnTab("CurrentPaneDomain")},
            {key="p", mods="LEADER", action = wezterm.action.MoveTabRelative(-1)},
            {key="n", mods="LEADER", action = wezterm.action.MoveTabRelative(1)}
          }
        }
      '';
    };
  };
}
