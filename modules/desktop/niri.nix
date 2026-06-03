{ config, pkgs, ... }:
{
	programs.niri.enable = true;
	services.xserver.enable = true;
}
