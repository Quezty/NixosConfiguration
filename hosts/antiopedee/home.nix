{
  config,
  pkgs,
  ...
}: {
  imports = [
    ../../modules/home/default.nix
  ];

  home.username = "joachimos";
  home.homeDirectory = "/home/joachimos";

  useWezterm.enable = true;
  addGit.enable = true;
  useKitty.enable = false;
  useNeovim.enable = true;

  home.stateVersion = "24.05"; # Please read the comment before changing.

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
