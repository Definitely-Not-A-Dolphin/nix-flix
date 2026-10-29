{ pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../core/default.nix
    ../../modules/default.nix
  ];

  boot.binfmt.emulatedSystems = [ "aarch64-linux" ];
  nix.settings.extra-platforms = [ "aarch64-linux" ];

  environment.systemPackages = with pkgs; [
    # 3d printing
    orca-slicer

    # Music
    id3v2
    bandcampsync
  ];

  networking.hostName = "six";

  system.stateVersion = "25.11";
}
