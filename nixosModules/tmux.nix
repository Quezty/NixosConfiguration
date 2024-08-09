{ pkgs, ...}:
{
  programs.tmux = {
	enable = true;
	baseIndex = 1;
	plugins = with pkgs; [
	    tmuxPlugins.better-mouse-mode
        tmuxPlugins.vim-tmux-navigator
        tmuxPlugins.nord
	];
    extraConfig= ''
      set-option -g status-position top
    '';
    #       set-option -g status-style bg=default
  };
}
