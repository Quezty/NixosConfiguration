{  inputs, pkgs, ...}:
let 
 input = inputs.nixpkgs.legacyPackages.${pkgs.system}; 
in 
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
    input.zsh
    input.bat
    input.eza
    input.fd
    input.fzf
    input.pfetch
    input.neofetch
    input.btop
  ];
}
