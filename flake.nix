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
    inputs@{ self, nixpkgs, ... }:
    {
      nixosConfigurations.awesomebox = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
          # ... other modules
          ./noctalia.nix
        ];
      };
    };
}
