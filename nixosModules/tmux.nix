{ pkgs, ...}:
{
  programs.tmux = {
	enable = true;
	baseIndex = 1;
	plugins = with pkgs; [
	    tmuxPlugins.better-mouse-mode
        tmuxPlugins.vim-tmux-navigator
	];
    extraConfigBeforePlugins = ''
        set -g @plugin 'rose-pine/tmux'
        set -g @rose-pine-variant 'moon'
    '';
  };
}
