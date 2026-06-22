{
  description = "A nix flix flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
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
            ./systems/core/default.nix
            ./systems/six/default.nix
          ];

          specialArgs = { inherit inputs; };
        };
        lumi = nixpkgs.lib.nixosSystem {
          modules = [
            ./systems/core/default.nix
            ./systems/lumi/default.nix
          ];

          specialArgs = { inherit inputs; };
        };
      };
    };
}
