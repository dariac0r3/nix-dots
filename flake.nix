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
	};

	outputs = { nixpkgs, home-manager, plasma-manager, ... }: {
		nixosConfigurations.nix-btw = nixpkgs.lib.nixosSystem {
			system = "x86_64-linux";
			modules = [
				./configuration.nix
				home-manager.nixosModules.home-manager
				{
					home-manager = {
						useGlobalPkgs = true;
						useUserPackages = true;
						users.daria = import ./home.nix;
						backupFileExtension = "backup";
						sharedModules = [ plasma-manager.homeModules.plasma-manager ];
					};
				}
			];
		};
	};
}

