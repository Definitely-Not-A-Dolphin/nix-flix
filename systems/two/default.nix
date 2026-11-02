{ pkgs, ... }:
{
  imports = [
    ../core
  ];

  environment.systemPackages = with pkgs; [
    # Gaming
    bs-manager
    wayvr
  ];

  networking.hostName = "two";

  system.stateVersion = "25.11";
}
