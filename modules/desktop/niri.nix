{ config, pkgs, ... }:

{
	programs.niri.enable = true;
	services.xserver.enable = true;
	systemd.user.services.niri.enableDefaultPath = false;
	services.power-profiles-daemon.enable = true;
	services.upower.enable = true;

	environment.systemPackages = with pkgs; [
		wl-clipboard
		wayland-utils
		cage
		gamescope
		nautilus
		catppuccin-cursors.mochaMauve
		brightnessctl
		libarchive
		loupe
		kdePackages.kate
		xdg-desktop-portal-wlr
	];
}
