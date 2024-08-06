{  inputs, pkgs, ...}:
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
    inputs.nixpkgs.legacyPackages.${pkgs.system}.zsh
    inputs.nixpkgs.legacyPackages.${pkgs.system}.bat
    inputs.nixpkgs.legacyPackages.${pkgs.system}.eza
    inputs.nixpkgs.legacyPackages.${pkgs.system}.fd
    inputs.nixpkgs.legacyPackages.${pkgs.system}.fzf
    pfetch
  ];
}
