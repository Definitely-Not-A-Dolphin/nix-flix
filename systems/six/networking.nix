{ pkgs, ... }:
{
  networking.networkmanager.enable = true;
  networking.hostName = "six";
}
