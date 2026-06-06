{ pkgs, ... }:
{
  imports = [
    ./networking.nix
    ./hardware-configuration.nix

    ../core/default.nix

    ../../modules/nixos/default.nix
    ../../modules/home-manager/default.nix

    ../../users/killioiden/default.nix
  ];

  environment.systemPackages = with pkgs; [
    #bambu-studio

    # Utils
    kdePackages.dolphin
    firefox
    fuzzel
    home-manager

    # WM
    hyprland
    noctalia-shell
    wayland

    # coding
    deno
    lua-language-server
    nil
    nixd
    zed-editor

    signal-desktop
    spotify
    steam
    vesktop
  ];

  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  hardware.bluetooth.enable = true;

  services = {
    geoclue2.enable = true;
    upower.enable = true;
    power-profiles-daemon.enable = true;
  };

  system.stateVersion = "25.11";
}
