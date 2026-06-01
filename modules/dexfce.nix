{ config, pkgs, ... }:
{
	environment.systemPackages = with pkgs; [
		xfce4-whiskermenu-plugin
		xfce4-pulseaudio-plugin
		blueman
	];

	services.xserver.desktopManager.xfce.enable = true;
}
