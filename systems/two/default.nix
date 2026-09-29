{ lib, pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../core/default.nix
    ../../modules/default.nix
  ];

  environment.systemPackages = with pkgs; [
    # 3d printing
    orca-slicer
    bs-manager
  ];

  networking.hostName = "two";

  home-manager.users.killioiden.programs.noctalia-shell.settings.idle = lib.mkForce {
    lockTimeout = 36000;
    screenOffTimeout = 36000;
    suspendTimeout = 36000;
  };

  system.stateVersion = "25.11";
}
