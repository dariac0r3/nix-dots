{ config, pkgs, ...}:

{
	imports = [
		./modules/plasma.nix
		./modules/xfce.nix
		./modules/firefox.nix
		./modules/bash.nix
		./modules/alacritty.nix
	];
	
	home.username = "daria";
	home.homeDirectory = "/home/daria";
	home.stateVersion = "25.11";

	home.packages = with pkgs; [
		bat
		discord
		amberol
		vlc
		prismlauncher
	];
}
