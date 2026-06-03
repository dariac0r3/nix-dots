{ config, pkgs, ... }:

{
    programs.plasma = {
		enable = true;
		workspace = {
			lookAndFeel = "org.kde.breezelight.desktop";
			cursor = {
				theme = "Breeze_Light";
				size = 24;
			};
			iconTheme = "Papirus-Dark";
			wallpaper = "${pkgs.kdePackages.plasma-workspace-wallpapers}/share/wallpapers/Mountain/contents/images/5120x2880.png";
			splashScreen.theme = "None";
		};

		hotkeys.commands."launch-konsole" = {
			name = "Launch terminal";
			key = "Meta+Return";
			command = "alacritty";
		};

		panels = [
		{
			location = "bottom";
			widgets = [
			{
				name = "org.kde.plasma.kickoff";
				config = {
					General = {
						icon = "nix-snowflake";
						alphaSort = true;
					};
				};
			}
			{
				iconTasks = {
					launchers = [
						"applications:org.kde.dolphin.desktop"
						"applications:code.desktop"
						"applications:steam.desktop"
						"applications:discord.desktop"
						"applications:io.bassi.Amberol.desktop"
						"applications:firefox.desktop"
						"applications:Alacritty.desktop"
					];
				};
			}
			"org.kde.plasma.marginsseparator"
			{
				systemTray.items = {
					shown = [
						"org.kde.plasma.battery"
						"org.kde.plasma.bluetooth"
						"org.kde.plasma.networkmanagement"
						"org.kde.plasma.volume"
					];
					hidden = [
						"org.kde.plasma.brightness"
						"org.kde.plasma.clipboard"
					];
				};
			}
			{
				digitalClock = {
					calendar.firstDayOfWeek = "monday";
					time.format = "24h";
				};
			}
			];
		}
		];
	};
}
