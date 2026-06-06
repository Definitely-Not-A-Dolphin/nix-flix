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

    # illogical-flake = {
    #   url = "github:soymou/illogical-flake";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };

    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      ...
    }:
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

          # pkgs = import inputs.nixpkgs {
          #   system = "x86_64-linux";
          #   config = {
          #     allowUnfree = true;
          #   };
          # };

          specialArgs = { inherit inputs; };
        };
        thirtysix = nixpkgs.lib.nixosSystem {
          modules = [
            ./systems/core/default.nix
            ./systems/thirtysix/default.nix
          ];

          # pkgs = import inputs.nixpkgs {
          #   system = "x86_64-linux";
          #   config = {
          #     allowUnfree = true;
          #   };
          # };

          specialArgs = { inherit inputs; };
        };
      };
    };
}
