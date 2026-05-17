{
  description = "A nix flix flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # noctalia = {
    #   url = "github:noctalia-dev/noctalia-shell";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
  };

  outputs =
    inputs@{ self, nixpkgs, ... }:
    {
      nixosConfigurations.six = nixpkgs.lib.nixosSystem {
        modules = [
          # ... other modules
          ./systems/six
        ];

        # Do I just configure nix here as if it was configuration.nix
        system = "x86_64-linux";

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
