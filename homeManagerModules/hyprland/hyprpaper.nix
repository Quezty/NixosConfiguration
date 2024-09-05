{ ... }:

{
  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [
        "../../common/2kMountainwhite.jpg"
      ];

      wallpaper = [
        "DP-0, ../../common/2kMountainwhite.jpg"
        "HDMI-1, ../../common/2kMountainwhite.jpg"
      ];
    };
  };
}
