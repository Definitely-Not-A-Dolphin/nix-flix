{ pkgs, ... }:
{
  imports = [ ../core ];

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
