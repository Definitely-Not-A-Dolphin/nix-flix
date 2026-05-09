{
  description = "A nix flix flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    illogical-flake = {
      url = "github:soymou/illogical-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, illogical-flake }@inputs:
  {
    nixosConfigurations.six = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";

      pkgs = import inputs.nixpkgs { system = "x86_64-linux";
        config = {
          allowUnfree = true;
        };
      };
      specialArgs = { inherit inputs; };
      modules = [
        ./systems/six
        inputs.illogical-flake.homeManagerModules.default
        {
          programs.illogical-impulse.enable = true;
        }
      ];
    };
  };
}
