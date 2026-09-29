{ pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../core/default.nix
    ../../modules/default.nix
  ];

  environment.systemPackages = with pkgs; [
    # 3d printing
    orca-slicer
  ];

  networking.hostName = "six";

  system.stateVersion = "25.11";
}
