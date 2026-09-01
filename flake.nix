{
  description = "A nix flix flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{ nixpkgs, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      nixosConfigurations = {
        six = nixpkgs.lib.nixosSystem {
          modules = [
            ./systems/six/default.nix
          ];

          specialArgs = { inherit inputs; };
        };
        two = nixpkgs.lib.nixosSystem {
          modules = [
            ./systems/two/default.nix
          ];

          specialArgs = { inherit inputs; };
        };
      };
    };
}
