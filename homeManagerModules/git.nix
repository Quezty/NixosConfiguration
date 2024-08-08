{ pkgs, lib, config, ... }:


{
  options.addGit= {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enable Git with my user";
    };
  };


  config = lib.mkIf config.addGit.enable 
  {
    programs.git = {
      enable = true;
      userEmail = "storlijoachim@gmail.com";
      userName = "quezty";
    };

  };
}
