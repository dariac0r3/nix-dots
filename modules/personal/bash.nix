{ config, pkgs, ... }:

{
	programs.bash = {
		enable = true;
		shellAliases = {
			btw = "echo 'i use NixOS btw' && hyfetch";
			nrs = "sudo nixos-rebuild switch";
			nfu = "sudo nix flake update --flake /etc/nixos/";
			upgrade = "sudo nix flake update --flake /etc/nixos/ && sudo nixos-rebuild switch";
			nixedit = "sudo vim /etc/nixos/configuration.nix";
			flakeedit = "sudo vim /etc/nixos/flake.nix";
			homeedit = "sudo vim /etc/nixos/home.nix";
		};
		initExtra = ''
			PS1='\[\e[92m\]\u\[\e[0m\] \[\e[96m\]@\[\e[0m\] \[\e[92m\]\H\[\e[0m\] in \[\e[96m\]\w\[\e[0m\] \\$ '
		'';
	};
}
