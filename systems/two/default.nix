{ pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../core/default.nix
    ../../modules/default.nix
  ];

  environment.systemPackages = with pkgs; [
    # Gaming
    bs-manager
    wayvr
  ];

  networking.hostName = "two";

  system.stateVersion = "25.11";
}
