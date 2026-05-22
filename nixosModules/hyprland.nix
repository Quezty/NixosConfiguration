{ pkgs, lib, config, inputs, ...}:

{
  options = {
    useHyprland = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = true; 
      }; 
    };
  };

  config = lib.mkIf config.useHyprland.enable 
  {
    programs.hyprland = {
      enable = true;
      xwayland.enable = true;
    };

    services.displayManager.sddm = {
      enable = true;
      wayland.enable = true;
    };
    environment.sessionVariables = {
      NIXOS_OZONE_WL = "1";
    };

    environment.systemPackages = with pkgs; [
      hyprcursor
      rose-pine-hyprcursor
      hyprland # Grabbing the hyprland package
      wl-clipboard # Clipboard 
      kitty # Base terminal for hyprland, will be changed to wezterm later 
      grim # Take picture of screen or region selected by Slurp
      slurp # Select region of screen
      imv # View images in the terminal, supported in kitty

      # Installing noctalia shell package from input
      inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
    ];

    hardware = {
      graphics.enable = true;
    };

    xdg.portal.enable = true;
    xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };
}
