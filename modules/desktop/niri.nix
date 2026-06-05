{ config, pkgs, ... }:

{
	programs.niri.enable = true;
	services.xserver.enable = true;

	environment.systemPackages = with pkgs; [
		wl-clipboard
		wayland-utils
		cage
		gamescope
		nautilus
		catppuccin-cursors.mochaMauve
	];
	systemd.user.services.niri.enableDefaultPath = false;
}
