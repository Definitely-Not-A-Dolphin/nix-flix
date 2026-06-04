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
    inputs@{ self, nixpkgs, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      nixosConfigurations.six = nixpkgs.lib.nixosSystem {
        modules = [
          ./systems/core/default.nix
          ./systems/six/default.nix
          {
            wayland.windowManager.hyprland = {
              enable = true;
              # set the flake package
              package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
              portalPackage =
                inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
            };
          }
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
}
