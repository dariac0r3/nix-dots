{ config, pkgs, lib, ... }:

{
	home.file.".config/niri/config.kdl" = { source = ./config.kdl; };
	home.packages = [pkgs.catppuccin-cursors.mochaMauve pkgs.fuzzel pkgs.xwayland-satellite pkgs.xwayland-run];

	programs.fuzzel.enable = true;
	programs.fuzzel.settings = {
		main = {
			terminal = "${pkgs.alacritty}/bin/alacritty";
			layer = "overlay";
		};
		colors = {
			background = "1e1e2edd";
			text = "cdd6f4ff";
			prompt = "bac2deff";
			placeholder = "7f849cff";
			input = "cdd6f4ff";
			match = "cba6f7ff";
			selection = "585b70ff";
			selection-match = "cba6f7ff";
			selection-text = "cba6f7ff";
			counter = "7f849cff";
			border = "cba6f7ff";
		};
	};

	home.pointerCursor = {
		gtk.enable = true;
		package = pkgs.catppuccin-cursors.mochaMauve;
		name = "catppuccin-mocha-mauve-cursors";
		size = 24;
		x11.enable = true;
	};
	
	gtk = {
		enable = true;
		theme = {
			name = "catppuccin-mocha-mauve-standard";
			package = (pkgs.catppuccin-gtk.override 
				{ variant = "mocha";
				  accents = [ "mauve" ];
				}
			);
		};
		cursorTheme = {
			name = "catppuccin-mocha-mauve-cursors";
			package = pkgs.catppuccin-cursors.mochaMauve;
		};
	};
}
