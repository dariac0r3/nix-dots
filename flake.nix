{
	description = "a flake that sometimes works(tm)";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		niri.url = "github:sodiboo/niri-flake";
		catppuccin.url = "github:catppuccin/nix";
		noctalia = {
			url = "github:noctalia-dev/noctalia-shell/v4.7.7";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	outputs = { nixpkgs, home-manager, niri, catppuccin,  ... }@inputs: {
		nixosConfigurations.nix = nixpkgs.lib.nixosSystem {
			system = "x86_64-linux";
			specialArgs = { inherit inputs; };

			modules = [
				./configuration.nix
				home-manager.nixosModules.home-manager
				./modules/noctalia.nix
				{
					home-manager = {
						useGlobalPkgs = true;
						useUserPackages = true;
						users.daria.imports = [ ./home.nix
									catppuccin.homeModules.catppuccin
									niri.homeModules.niri
						];
						backupFileExtension = "backup";
						extraSpecialArgs = { inherit inputs; };
					};
				}
			];
		};
	};
}

