{ config, pkgs, ... }:
{
  imports = [
    ./wezterm.nix
    ./git.nix
    ./zsh.nix
  ];
}
