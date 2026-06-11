{ config, pkgs, lib, ... }:

{
	home.packages = [
		pkgs.catppuccin-cursors.mochaMauve
		pkgs.fuzzel
		pkgs.xwayland-satellite
		pkgs.xwayland-run
	];
	
	programs.fuzzel = {
		enable = true;
		settings = {
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
	};

	home.pointerCursor = {
		gtk.enable = true;
		package = pkgs.catppuccin-cursors.mochaMauve;
		name = "catppuccin-mocha-mauve-cursors";
		size = 24;
		x11.enable = true;
	};
		
	catppuccin = {
		enable = true;
		autoEnable = true;
		firefox.enable = false;
		
	};
	
	gtk = {
		enable = true;
		gtk4.theme = config.gtk.theme;

		theme = {
			name = "catppuccin-mocha-mauve-standard";
			package = (pkgs.catppuccin-gtk.override 
				{ 
					variant = "mocha";
					accents = [ "mauve" ];
				}
			);
		};

		cursorTheme = {
			name = "catppuccin-mocha-mauve-cursors";
			package = pkgs.catppuccin-cursors.mochaMauve;
		};
	};

	## Niri home-manager config goes here...

	##	 ̄ \_(ツ)_/ ̄

	programs.niri = {
		enable = true;
		settings = {
			input = {
				focus-follows-mouse = {
					enable = true;
					max-scroll-amount = "0%";
				};
	
				keyboard.xkb = {
					layout = "pl";
				};
				touchpad = {
					tap = true;
					natural-scroll = false;
				};
				mouse = {};
				trackpoint = {};
			};

		### This is for my laptop display specifically,
		### your config may be different so comment this section out from 
		### // here to-

			outputs."eDP-1" = {
				mode = {
					width = 1920;
					height = 1080;
					refresh = 60.0;
				};
				scale = 1.0;
				position = {
					x = 1280;
					y = 0;
				};
				variable-refresh-rate = true;
			};
		### // -to here.
			layout = {
				gaps = 12;
				center-focused-column = "never";
				preset-column-widths = [
					{ proportion = 0.33333; }
					{ proportion = 0.5; }
					{ proportion = 0.66667; }
				];
				default-column-width = { proportion = 0.66667; };
				focus-ring = {
					enable = true;
					width = 4;
					active.gradient = {
						from = "#f5bde6";
						to = "#c6a0f6";
						angle = 45;
					};
					inactive.gradient = {
						from = "#6e738d";
						to = "#24273a";
						angle = 45;
					};
				};
				border = {
					enable = false;
				};
				shadow = {
					enable = true;
					softness = 30;
					spread = 5;
					offset = {
						x = 0;
						y = 5;
					};
					color = "#0007";
				};
				struts = {};
			};
			cursor = {
				theme = "catppuccin-mocha-mauve-cursors";
				size = 24;
			};
			hotkey-overlay = {
				skip-at-startup = true;
			};
			spawn-at-startup = [
				{ command = [ "noctalia-shell" ]; }
			];
			screenshot-path = "~/Pictures/Screenshots/Screenshot from %Y-%m-%d %H-%M-%S.png";
			animations = {
				enable = true;
			};

			## windo rules

			window-rules = [
				{
					matches = [
						{
							app-id = "^Alacritty$";
						}
					];					
					open-floating = true;
					draw-border-with-background = false;
					opacity = 0.9;
				}
				{
					matches = [
						{
							app-id = "steam";
							title = "^notificationtoasts_\\d+_desktop$";
						}
					];
					default-floating-position = {
						x = 10;
						y = 10;
						relative-to = "top-right";
					};
				}
				{
					matches = [
						{
							app-id = "^firefox$";
						}
					];
					open-maximized = true;
				}
				{
					geometry-corner-radius = {
						top-left = 12.0;
						top-right = 12.0;
						bottom-left = 12.0;
						bottom-right = 12.0;
					};
					clip-to-geometry = true;
				}
			];
			
			### KEYBINDS LIVE HERE

			binds = {
				"Mod+Return".action.spawn = "alacritty";
				"Mod+D".action.spawn = "fuzzel";
				"Mod+W".action.spawn = "firefox";
				"Mod+N".action.spawn = "nautilus";
				"Mod+Q".action.close-window = {};

				"XF86AudioRaiseVolume".action.spawn-sh = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.05+ -l 1.0";
				"XF86AudioLowerVolume".action.spawn-sh = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.05- -l 1.0";
				"XF86AudioMute".action.spawn-sh = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
				"XF86AudioMicMute".action.spawn-sh = "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle";
				"XF86AudioPlay".action.spawn-sh = "playerctl play-pause";
				"XF86AudioStop".action.spawn-sh = "playerctl stop";
				"XF86AudioPrev".action.spawn-sh = "playerctl previous";
				"XF86AudioNext".action.spawn-sh = "playerctl next";
				"XF86MonBrightnessUp" = { action.spawn-sh = "brightnessctl --class=backlight set +5%"; };
				"XF86MonBrightnessDown" = { action.spawn-sh = "brightnessctl --class=backlight set 5%-"; };
				"Mod+O".action.toggle-overview = {};
				"Mod+Space".action.toggle-overview = {};
                                "Mod+1".action.focus-workspace = 1;
                                "Mod+2".action.focus-workspace = 2;
                                "Mod+3".action.focus-workspace = 3;
                                "Mod+4".action.focus-workspace = 4;
                                "Mod+5".action.focus-workspace = 5;
                                "Mod+6".action.focus-workspace = 6;
                                "Mod+7".action.focus-workspace = 7;
                                "Mod+8".action.focus-workspace = 8;
                                "Mod+9".action.focus-workspace = 9;
                                "Mod+Ctrl+1".action.move-column-to-workspace = 1;
                                "Mod+Ctrl+2".action.move-column-to-workspace = 2;
                                "Mod+Ctrl+3".action.move-column-to-workspace = 3;
                                "Mod+Ctrl+4".action.move-column-to-workspace = 4;
                                "Mod+Ctrl+5".action.move-column-to-workspace = 5;
                                "Mod+Ctrl+6".action.move-column-to-workspace = 6;
                                "Mod+Ctrl+7".action.move-column-to-workspace = 7;
                                "Mod+Ctrl+8".action.move-column-to-workspace = 8;
                                "Mod+Ctrl+9".action.move-column-to-workspace = 9;

				"Mod+V".action.toggle-window-floating = {};
				"Mod+Shift+V".action.switch-focus-between-floating-and-tiling = {};
				"Mod+Shift+W".action.toggle-column-tabbed-display = {};

				"Print".action.screenshot = {};
				"Ctrl+Print".action.screenshot-screen = {};
				"Alt+Print".action.screenshot-window = {};

				"Mod+C".action.center-column = {};
				"Mod+Ctrl+C".action.center-visible-columns = {};
				"Mod+Minus".action.set-column-width = "-10%";
				"Mod+Equal".action.set-column-width = "+10%";
				"Mod+Shift+Minus".action.set-window-height = "-10%";
				"Mod+Shift+Equal".action.set-window-height = "+10%";
				"Mod+F".action.maximize-column = {};
				"Mod+Shift+F".action.fullscreen-window = {};
				"Mod+Ctrl+F".action.expand-column-to-available-width = {};
				"Mod+R".action.switch-preset-window-height = {};
				"Mod+Shift+R".action.switch-preset-column-width-back = {};
				"Mod+Ctrl+Shift+R".action.switch-preset-window-height = {};
				"Mod+Ctrl+R".action.reset-window-height = {};

				"Mod+Shift+WheelScrollDown".action.focus-column-right = {};
				"Mod+Shift+WheelScrollUp".action.focus-column-left = {};
				"Mod+Ctrl+WheelScrollRight".action.move-column-right = {};
				"Mod+Ctrl+WheelScrollLeft".action.move-column-left = {};
				"Mod+Ctrl+Shift+WheelScrollDown".action.move-column-right = {};
				"Mod+Ctrl+Shift+WheelScrollUp".action.move-column-left = {};

				"Mod+Escape".action.toggle-keyboard-shortcuts-inhibit = {};
				"Mod+Shift+E".action.quit = {};
				"Ctrl+Alt+Delete".action.quit = {};
			};
		};
	};
}
