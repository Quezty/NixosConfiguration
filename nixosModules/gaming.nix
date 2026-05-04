{ pkgs, lib, config, ...}: 
{
  options = {
    gamingMods = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = false;
      };
    };
  };

  config = lib.mkIf config.generalPackages.enable 
  {
    programs = {
      steam = {
        enable = true;
        gamescopeSession.enable = true;
      };
      gamemode.enable = true;
    };

    environment.systemPackages = with pkgs; [
      mangohud 
      protonup-qt 
      lutris 
      bottles 
      heroic
    ];
  };
}
