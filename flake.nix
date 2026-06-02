{
  description = "A nix flix flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{ nixpkgs, home-manager, ... }:
    {
      nixosConfigurations.six = nixpkgs.lib.nixosSystem {
        modules = [
          ./modules/default.nix
          ./systems/core/default.nix
          ./systems/six/default.nix
          inputs.home-manager.nixosModules.default
        ];

        pkgs = import inputs.nixpkgs {
          system = "x86_64-linux";
          config = {
            allowUnfree = true;
          };
        };

        extraSpecialArgs = { inherit inputs; };
      };
    };
}
