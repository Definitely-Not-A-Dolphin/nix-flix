{ pkgs, ... }:
{
  imports = [
    ./networking.nix
    ./hardware-configuration.nix
    ../core/default.nix
    ../../modules/default.nix
  ];

  system.stateVersion = "25.11";
}
