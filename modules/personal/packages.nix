{ config, pkgs, ... }:

{
	services.xserver.enable = true;
	services.displayManager.ly.enable = true;
	programs.steam.enable = true;

	nixpkgs.config.allowUnfree = true;
	environment.systemPackages = with pkgs; [
		vim
		hyfetch
		gpu-screen-recorder-gtk
		vscode
		ffmpeg
		git
		alacritty
		(olympus.override { celesteWrapper = "steam-run"; })
		krita
		kdePackages.kdenlive
	];
}
