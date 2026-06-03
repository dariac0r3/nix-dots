{ config, pkgs, ... }:

	let 
		lock-false = {
			Value = false;
			Status = "locked";
		};
		lock-true = {
			Value = true;
			Status = "locked";
		};
	in
{
	programs = {
		firefox = {
			enable = true;
			package = pkgs.wrapFirefox pkgs.firefox-unwrapped {
				extraPolicies = {
					DisableTelemetry = true;
					ExtensionSettings = {
						"*".installation_mode = "blocked";
						"uBlock0@raymondhill.net" = {
							install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
							installation_mode = "force_installed";
						};
					};
					Preferences = {
						"browser.newtabpage.activity-stream.showSponsored" = lock-false;
						"browser.newtabpage.activity-stream.system.showSponsored" = lock-false;
						"browser.newtabpage.activity-stream.showSponsoredTopSites" = lock-false;
					};
					
				};
			};
			profiles = {
				profile_0 = {
					id = 0;
					name = "profile_0";
					isDefault = true;
				};
			};
		};
	};
}
