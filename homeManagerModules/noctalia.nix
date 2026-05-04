{ pkgs, lib, config, inputs, ... }:
{
  imports = [ inputs.noctalia.homeModules.default ]; # <- top level, always imported

  options = {
    useNoctalia = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = false;
      };
    };
  };

  config = lib.mkIf config.useNoctalia.enable {
    # no imports here, just config
    programs.noctalia-shell = {
      enable = true;
      settings = ./noctalia-conf.json;
    };
  };
}
