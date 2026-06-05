{ config, pkgs, ...}:

{
	imports = [
		./modules/personal/firefox.nix
		./modules/personal/bash.nix
		./modules/personal/alacritty.nix
#		./modules/desktop/plasma-home.nix
#		./modules/desktop/xfce-home.nix
#		./modules/desktop/niri-home.nix
	];
	
	home.username = "daria";
	home.homeDirectory = "/home/daria";
	home.stateVersion = "25.11";

	home.packages = with pkgs; [
		bat
		discord
		amberol
		vlc
	];
}
