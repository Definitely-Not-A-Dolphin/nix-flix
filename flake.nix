{
  description = "A nix flix flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

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
    inputs@{ nixpkgs, home-manager, ... }:
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
        homeConfigurations.killioiden = home-manager.lib.homeManagerConfiguration {
          modules = [ ./modules/home-manager/home.nix ];

          extraSpecialArgs = { inherit inputs; };
        };
      };
    };
}
