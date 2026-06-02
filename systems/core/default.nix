{ ... }:
{
  imports = [
    ../../modules/default.nix
  ];

  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "25.11";
}
