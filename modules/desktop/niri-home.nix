{ config, pkgs, ... }:
{
	programs.niri = {
		enable = true;
		settings = {
			layout = {
				gaps = 8;
				center-focused-column = "on-newline";
				focus-ring = {
					enable = true;
				};
			};
		};
	};
}
