{ pkgs, lib, config, ... }:


{
  options.addZsh = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Enable zsh and my config";
    };
  };


  config = lib.mkIf config.addZsh.enable  
  {
    programs.zsh = {
      enable = true;
      syntaxHighlighting.enable = true;
      autosuggestion.enable = true;
      enableCompletion = true;
      shellAliases = {
        ls = "eza --color=always --long --no-filesize --icons=always --no-time --no-user --no-permissions"; 
        tls = "eza --tree --level=2 --icons=always --color=always";
        tlsd = "eza --tree --level=6 --icons=always --color=always";
        nls = "ls";
        rebuildDesktop = "sudo nixos-rebuild switch --flake ~/repos/NixosConfiguration#desktop";
        rebuildLaptop = "sudo nixos-rebuild switch --flake ~/repos/NixosConfiguration#laptop";
      };
      oh-my-zsh = {
        enable = true;
        theme = "avit";
      };
      initExtra = ''


eval "$(fzf --zsh)"

export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

_fzf_compgen_path () {
	fd --hidden --exclude .git . "$1"
}

_fzf_compgen_dir () {
	fd --type=d --hidden --exclude .git . "$1"
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_CTRL_T_OPTS="--preview 'bat -n --color=always --line-range :500 {}'"
export FZF_ALT_C_OPTS="--preview 'eza --tre --color=always {} | head -200'"

_fzf_comprun() {
	local command=$1
	shift

	case "$command" in
		cd) fzf --preview 'eza --tree --color=always {} | head -200' "$@";;
		export|unset) fzf --preview "eval 'echo \$' {}"	"$@" ;;
		ssh) fzf --preview 'dig{}'	"$@" ;;
		*) fzf --preview "--preview 'bat -n --color=always --line-range :500 {}'" "$@" ;;
	esac

}

export BAT_THEME=Nord

      ''; 
    };
  };
}
