{
	description = "a flake that sometimes works(tm)";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		plasma-manager = {
			url = "github:nix-community/plasma-manager";
			inputs.nixpkgs.follows = "nixpkgs";
			inputs.home-manager.follows = "home-manager";
		};
		niri.url = "github:sodiboo/niri-flake";
		catppuccin.url = "github:catppuccin/nix";
		noctalia = {
			url = "github:noctalia-dev/noctalia-shell";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	outputs = { nixpkgs, home-manager, plasma-manager,niri,catppuccin,noctalia,  ... }@inputs: {
		nixosConfigurations.nix-btw = nixpkgs.lib.nixosSystem {
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
						];
						backupFileExtension = "backup";
						sharedModules = [ plasma-manager.homeModules.plasma-manager ];
						extraSpecialArgs = { inherit inputs; };
					};
				}
			];
		};
	};
}

