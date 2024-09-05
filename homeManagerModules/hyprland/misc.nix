{ ... }:

{
  wayland.windowManager.hyprland.settings = {
    exec-once = [
      "waybar"
      "hyprlock"
    ];

    input = {
      kb_layout = "us";
    };

    env = "XCURSOR_SIZE, 24";

    master = {
      new_status = "slave";
    };

    misc = {
      force_default_wallpaper = 0;
    };
  };
}
