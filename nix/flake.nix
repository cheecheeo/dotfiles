# run:
# nix --extra-experimental-features nix-command --extra-experimental-features flakes flake update
# sudo nixos-rebuild switch --flake .
{
  description = "NixOS configuration with Home Manager and Git";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    nixos-wsl = {
      url = "github:nix-community/NixOS-WSL";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixos-wsl, home-manager, ... }: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        nixos-wsl.nixosModules.wsl
        ./configuration.nix
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.nixos = { pkgs, ... }: {
            home.packages = [ pkgs.tmux pkgs.docker ];
	    #none of this nvim stuff works for some reason
            home.stateVersion = "24.11";
            programs.neovim = {
	      enable = true;
	      defaultEditor = true;
              viAlias = true;
              vimAlias = true;
            };
            programs.git = {
              enable = true;
              userName = "John Chee";
              userEmail = "johnanchee@gmail.com";
              extraConfig = {
                github.user = "cheecheeo";
		core = {
		  editor = "nvim";
		};
              };
            };
          };
        }
      ];
    };
  };
}
