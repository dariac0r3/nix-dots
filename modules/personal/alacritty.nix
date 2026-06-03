{ config, pkgs, ... }:

{
	programs.alacritty = {
		enable = true;
		theme = "catppuccin_mocha";
		settings = {
			window = {
				dimensions = {
					columns = 100;
					lines = 30;
				};
				opacity = 0.95;
			};
		};
	};
}
