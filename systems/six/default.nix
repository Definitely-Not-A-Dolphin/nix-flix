{ pkgs, ... }:
{
  imports = [
    ./networking.nix
    ./hardware-configuration.nix

    ../../modules/nixos/display
    ../../modules/nixos/locale.nix
    ../../modules/nixos/fonts.nix

    ../../users/derekv
  ];

  services.geoclue2.enable = true;
  services.upower.enable = true;

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  system.stateVersion = "25.11";
}
