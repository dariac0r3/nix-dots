{ config, pkgs, ... }:

{
	imports =
		[ 
			./hardware-configuration.nix
			./modules/graphics.nix
			./modules/personal/packages.nix
			./modules/personal/user.nix
			./modules/desktop/plasma.nix
#			./modules/desktop/xfce.nix
#			./modules/desktop/niri.nix
		];

	  # Bootloader.
	boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;
	boot.loader.systemd-boot.configurationLimit = 3;

	  # enable flakes
	nix.settings.experimental-features = [ "nix-command" "flakes" ];

	  # Enable networking
	networking.networkmanager.enable = true;
	hardware.bluetooth.enable = true;
	networking.hostName = "nix-btw";

	  # enable audio and screensharing
	services.pipewire = {
		enable = true;
		alsa.enable = true;
		alsa.support32Bit = true;
		pulse.enable = true;
	};

	  # Set your time zone and internationalisation settings
	time.timeZone = "Europe/Warsaw";
	i18n.defaultLocale = "en_US.UTF-8";
	i18n.extraLocaleSettings = {
		LC_ADDRESS = "pl_PL.UTF-8";
		LC_IDENTIFICATION = "pl_PL.UTF-8";
		LC_MEASUREMENT = "pl_PL.UTF-8";
		LC_MONETARY = "pl_PL.UTF-8";
		LC_NAME = "pl_PL.UTF-8";
		LC_NUMERIC = "pl_PL.UTF-8";
		LC_PAPER = "pl_PL.UTF-8";
		LC_TELEPHONE = "pl_PL.UTF-8";
		LC_TIME = "pl_PL.UTF-8";
	};

	  # Configure keymap in X11
	console.keyMap = "pl2";
	services.xserver.xkb = {
		layout = "pl";
		variant = "";
	};

	system.stateVersion = "25.11";
}
