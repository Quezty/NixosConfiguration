{ config, pkgs, ... }:

{
  imports = [
    ../../homeManagerModules/default.nix
  ];


  home.username = "joachims";
  home.homeDirectory = "/home/joachims";
  
  useWezterm.enable = true;
  addGit.enable = true;
  useKitty.enable = true;


  home.stateVersion = "24.05"; # Please read the comment before changing.

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
