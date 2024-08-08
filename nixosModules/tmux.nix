{ pkgs, ...}:
{
  programs.tmux = {
	enable = true;
	baseIndex = 1;
	plugins = with pkgs; [
	    tmuxPlugins.better-mouse-mode
        tmuxPlugins.vim-tmux-navigator
        tmuxPlugins.rose-pine
	];
  };
}
