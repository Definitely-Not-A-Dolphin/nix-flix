{ pkgs, ... }:
{
  imports = [
    ./networking.nix
    ./hardware-configuration.nix
    ../core/default.nix
    ../../modules/default.nix
  ];

  environment.systemPackages = with pkgs; [
    # 3d printing
    orca-slicer
  ];

  system.stateVersion = "25.11";
}
