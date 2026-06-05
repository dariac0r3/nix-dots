{ config, pkgs, ... }:

{
	environment.systemPackages = with pkgs; [
		xfce4-whiskermenu-plugin
		xfce4-pulseaudio-plugin
		blueman
		xfce4-dockbarx-plugin
	];

	services.xserver.desktopManager.xfce.enable = true;
}
