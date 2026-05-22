{ pkgs, ...}:
{
  users.defaultUserShell = pkgs.zsh;
  environment.systemPackages = with pkgs; [
    zsh
    bat
    eza
    fd
    fzf
    pfetch
    fastfetch
    btop
  ];
}
