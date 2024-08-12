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
          enable_tab_bar = false,
          font = wezterm.font("JetBrainsMono Nerd Font", {weight="Bold", stretch="Normal", style="Normal"}),
          leader = {key="Space", mods = "CTRL", timeout_milliseconds = 1000},
          keys = {
            {key="u", mods="LEADER", action = wezterm.action.SplitVertical ({domain = "CurrentPaneDomain"})},
            {key="i", mods="LEADER", action = wezterm.action.SplitHorizontal ({domain = "CurrentPaneDomain"})},
            {key="c", mods="LEADER", action = wezterm.action.SpawnTab("CurrentPaneDomain")},
            {key="p", mods="LEADER", action = wezterm.action.MoveTabRelative(-1)},
            {key="n", mods="LEADER", action = wezterm.action.MoveTabRelative(1)},
            {key="h", mods="CTRL", action = wezterm.action.ActivatePaneDirection("Left")},
            {key="j", mods="CTRL", action = wezterm.action.ActivatePaneDirection("Down")},
            {key="k", mods="CTRL", action = wezterm.action.ActivatePaneDirection("Up")},
            {key="l", mods="CTRL", action = wezterm.action.ActivatePaneDirection("Right")}
          },

          inactive_pane_hsb = {
            saturation = 0.74,
            brightness = 0.4
          },

          background = {
            {
              source = {
                File = "/home/joachims/repos/NixosConfiguration/common/wezterm-background.jpg",
              },
              hsb = {
                hue = 1.0,
                saturation = 1.0,
                brightness = 0.25,
              },
              width = "100%",
              height = "100%",
            },
            {
              source = {
                Color = "46474f",
              },
              width = "100%",
              height = "100%",
              opacity = 0.35,
            }
          }
        }
      '';
    };
  };
}
