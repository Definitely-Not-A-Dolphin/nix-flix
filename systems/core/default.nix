{ ... }:
{
  imports = [
    ../../modules/default.nix
  ];

  programs.fish.enable = true;

  system.stateVersion = "25.11";
}
