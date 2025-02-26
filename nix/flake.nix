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
            home.stateVersion = "24.11";
            programs.neovim = {
	      enable = true;
	      # this doesn't work for some reason
	      defaultEditor = true;
              viAlias = true;
              vimAlias = true;
	      plugins = with pkgs.vimPlugins; [
		vim-airline
		solarized-nvim
		papercolor-theme
	      ];
	      extraConfig = ''
	        set background=light
	        colorscheme PaperColor
	      '';
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
