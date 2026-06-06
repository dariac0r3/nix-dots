{ pkgs, inputs, ... }:

{
	imports = [
		inputs.noctalia.homeModules.default
	];

	home.file.".cache/noctalia/wallpapers.json" = {
		text = builtins.toJSON {
			defaultWallpaper = "/home/daria/Pictures/Wallpapers/wall.png";
			wallpapers = {
				"eDP-1" = "/home/daria/Pictures/Wallpapers/wall.png";
			};
		};
	};

	programs.noctalia-shell = {
		enable = true;
		settings = {
			bar = {
				density = "compact";
				position = "top";
				showCapsule = false;
				widgets = {
					left = [
						{
						id = "ControlCenter";
						useDistroLogo = true;
						}
						{
						id = "Network";
						}
						{
						id = "Bluetooth";
						}
						{
						id = "Tray";
						}
					];
					center = [
						{
						hideUnoccupied = false;
						id = "Workspace";
						labelMode = "none";		
						}
					];
					right = [
					{
					id = "Volume";
					}
					{
					id = "Brightness";
					}
					{
					alwaysShowPercentage = true;
					id = "Battery";
					warningThreshold = 20;
					}
					{
					formatHorizontal = "HH:mm";
					id = "Clock";
					useMonospacedFont = true;
					usePrimaryColor = true;
					}
					];
				};
			};
			colorSchemes.predefinedScheme = "Catppuccin";
			location = {
				monthBeforeDay = false;
				name = "Warsaw, Poland";
			};
			dock = {
				enabled = false;
			};
		};
	};
}
