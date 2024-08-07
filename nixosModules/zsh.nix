{ pkgs, ...}:
{
  users.defaultUserShell = pkgs.zsh;

  programs.zsh = {
    enable = true;
    syntaxHighlighting.enable = true;
    autosuggestions.enable = true;
    enableCompletion = true;
    ohMyZsh = {
      enable = true;
      theme = "avit";
    };
  };

  environment.systemPackages = with pkgs; [
    zsh
    bat
    eza
    fd
    fzf
    pfetch
    neofetch
    btop
  ];
}
