{ pkgs, lib, config, ... }:
{
  options = {
    useNeovim = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = false;
      };
    };
  };

  config = lib.mkIf config.useNeovim.enable {
    programs.neovim = {
      enable = true;
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;

      extraPackages = with pkgs; [
        # LSP servers
        nil # Nix
        lua-language-server
        pyright
        rust-analyzer rustc cargo
        typescript-language-server
        typescript
        vscode-langservers-extracted # html, css, json, eslint
        tailwindcss-language-server
        bash-language-server
        dockerfile-language-server-nodejs
        yaml-language-server
        clang-tools # clangd
        marksman
        haskell-language-server

        # Formatters
        alejandra
        nixpkgs-fmt
        stylua
        shfmt
        prettier
        ruff

        # Linters
        statix
        deadnix
        vale
        hadolint
        pylint

        # Tools needed by plugins
        ripgrep # telescope live grep
        fd # telescope file finder
        gcc # treesitter compilation
        tree-sitter # treesitter parser builds
        gnumake # telescope-fzf-native
        cmake # telescope-fzf-native
      ];
    };

    xdg.configFile."nvim" = {
      source = ./nvim;
      recursive = true;
    };
  };
}
