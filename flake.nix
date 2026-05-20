{
  description = "A nix flix flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{ nixpkgs, ... }:
    {
      nixosConfigurations.six = nixpkgs.lib.nixosSystem {
        modules = [
          ./modules/default.nix
          ./systems/core/default.nix
          ./systems/six/default.nix
        ];

        pkgs = import inputs.nixpkgs {
          system = "x86_64-linux";
          config = {
            allowUnfree = true;
          };
        };

        specialArgs = { inherit inputs; };
      };
    };
}
