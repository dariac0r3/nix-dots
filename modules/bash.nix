{ config, pkgs, ... }:

{
	programs.bash = {
		enable = true;
		shellAliases = {
			btw = "echo 'i use NixOS btw' && hyfetch";
			nrs = "sudo nixos-rebuild switch";
			nixedit = "sudo vim /etc/nixos/configuration.nix";
			flakeedit = "sudo vim /etc/nixos/flake.nix";
			homeedit = "sudo vim /etc/nixos/home.nix";
			plasmaedit = "sudo vim /etc/nixos/modules/plasma.nix";
			bashedit = "sudo vim /etc/nixos/modules/bash.nix";
			extraedit = "sudo vim /etc/nixos/modules/extra.nix";
			useredit = "sudo vim /etc/nixos/modules/user.nix";
			termedit = "sudo vim /etc/nixos/modules/alacritty.nix";
			ffedit = "sudo vim /etc/nixos/modules/firefox.nix";
		};
		initExtra = ''
			PS1='\[\e[92m\]\u\[\e[0m\] \[\e[96m\]@\[\e[0m\] \[\e[92m\]\H\[\e[0m\] in \[\e[96m\]\w\[\e[0m\] \\$ '
		'';
	};
}
