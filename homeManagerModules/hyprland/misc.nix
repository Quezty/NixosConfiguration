{ ... }:

{
  wayland.windowManager.hyprland.settings = {
    exec-once = [
      "waybar"
      "hyprlock"
    ];

    env = "XCURSOR_SIZE, 24";

    master = "new_status = slave";

    misc = "force_default_wallpaper = 0";
  };
}
