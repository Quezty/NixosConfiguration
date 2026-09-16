{
  inputs,
  pkgs,
  lib,
  config,
  ...
}: {
  imports = [inputs.spicetify-nix.homeManagerModules.default];

  options.useSpicetify = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Spotify themed with spicetify";
    };
  };

  config = lib.mkIf config.useSpicetify.enable {
    programs.spicetify = let
      spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.hostPlatform.system};
    in {
      enable = true;

      theme = spicePkgs.themes.hazy;
      colorScheme = "Base";

      enabledCustomApps = with spicePkgs.apps; [
        marketplace
      ];

      enabledExtensions = with spicePkgs.extensions; [
        adblockify
        shuffle
        keyboardShortcut
      ];
    };
  };
}
