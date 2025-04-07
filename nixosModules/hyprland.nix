{ pkgs, lib, config, ...}:

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

    services.xserver = {
      enable = true;
    };

    services.displayManager.sddm.enable = true;
    environment.sessionVariables = {
      WLR_NO_HARDWARE_CURSORS = "1";

      NIXOS_OZONE_WL = "1";
    };

    environment.systemPackages = with pkgs; [
      waybar # Fancy bar at the top :)
      # Packages that are used in my waybar conf to have a media player
      waybar-mpris
      playerctl
      
      hyprland # Grabbing the hyprland package
      wl-clipboard # Clipboard 
      dunst # Notification daemon
      libnotify # Used to send notifications through dunst
      hyprpaper # Wallpaper service for hyprland 
      hyprlock # Enables locking of the screen
      kitty # Base terminal for hyprland, will be changed to wezterm later 
      rofi-wayland # Window switching application
      grim # Take picture of screen or region selected by Slurp
      slurp # Select region of screen
      imv # View images in the terminal, supported in kitty


      bibata-cursors
    ];

    hardware = {
      graphics.enable = true;
    };

    xdg.portal.enable = true;
    xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };
}
