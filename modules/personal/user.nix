{ config, pkgs, ... }:

{
	users.users.daria = {
		isNormalUser = true;
		description = "Daria Silent";
		extraGroups = [ "networkmanager" "wheel" ];
		packages = with pkgs; [];
	};
}
