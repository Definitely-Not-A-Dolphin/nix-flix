{ lib, ... }:
{
  imports = [
    ./networking.nix
    ./hardware-configuration.nix
    ../core/default.nix
    ../../modules/default.nix
  ];

  system.stateVersion = "25.11";

  home-manager.users.killioiden.programs.noctalia-shell.settings.idle = lib.mkForce {
    lockTimeout = 36000;
    screenOffTimeout = 36000;
    suspendTimeout = 36000;
  };
}
