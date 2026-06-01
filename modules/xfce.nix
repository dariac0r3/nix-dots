{ config, pkgs, ... }:

{
	home.packages = with pkgs; [
		zuki-themes
		elementary-xfce-icon-theme
	];

	gtk = {
		enable = true;
		iconTheme = {
			name = "elementary-xfce";
			package = pkgs.elementary-xfce-icon-theme;
		};
		theme = {
			name = "Zukitre-dark";
			package = pkgs.zuki-themes;
		};
	};

	xfconf.settings = {
		xfwm4 = {
			"general/theme" = "Zukitre-dark";
		};
		xfce4-keyboard-shortcuts = {
			"commands/custom/<Super>Return" = "alacritty";
		};
		xfce4-panel = {
			"panels" = [ 1 ];
      
			"panels/panel-1/position" = "p=6;x=0;y=0";
			"panels/panel-1/length" = 100;
			"panels/panel-1/size" = 26;
			"panels/panel-1/position-locked" = true;
			"panels/panel-1/plugin-ids" = [ 1 3 2 9 8 4 7 5 6 ];

			"plugins/plugin-1" = "whiskermenu";
			"plugins/plugin-2" = "separator";
			"plugins/plugin-2/expand" = true;
			"plugins/plugin-2/style" = 0;

			"plugins/plugin-3" = "tasklist";
			"plugins/plugin-3/show-labels" = true;
			"plugins/plugin-3/grouping" = 1;
      
			"plugins/plugin-4" = "systray";
			"plugins/plugin-4/square-icons" = true;
			"plugins/plugin-4/icon-size" = 22;

			"plugins/plugin-5" = "clock";
			"plugins/plugin-5/digital-layout" = 3;
			"plugins/plugin-5/digital-time-font" = "Sans 12";

			"plugins/plugin-6" = "separator";
			"plugins/plugin-6/style" = 0;

			"plugins/plugin-7" = "separator";
			"plugins/plugin-7/style" = 0;

			"plugins/plugin-8" = "pulseaudio";
			"plugins/plugin-8/enable-keyboard-shortcuts" = "true";

			"plugins/plugin-9" = "power-manager-plugin";
		};
	};

	xdg.configFile."xfce4/panel/whiskermenu-1.rc".text = ''
		favorites = firefox.desktop,thunar.desktop,Alacritty.desktop,code.desktop,steam.desktop,discord.desktop,io.bassi.Amberol.desktop
		button-title = Applications
		button-icon = nix-snowflake
		show-button-title = false
		show-button-icon = true
		launcher-show-name = true
		launcher-show-description = false
		view-mode = 0
		menu-width = 450
		menu-height = 550
		position-search-alternate = false
		position-commands-alternate = false
		stay-on-focus-out = false
	'';

}
