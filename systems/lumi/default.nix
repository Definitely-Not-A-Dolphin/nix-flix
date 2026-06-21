{ pkgs, ... }:
{
  imports = [
    ./networking.nix
    ./hardware-configuration.nix
    ../core/default.nix
    ../../modules/nixos/default.nix
    ../../modules/home-manager/default.nix
    ../../users/killioiden.nix
  ];

  environment.systemPackages = with pkgs; [
    # 3D printing
    #bambu-studio

    # General
    appimage-run
    kdePackages.dolphin
    firefox
    fuzzel
    home-manager
    signal-desktop
    spotify
    steam
    vesktop

    # WM
    hyprland
    hyprshot
    hyprlock
    noctalia-shell
    nwg-displays
    wayland

    # Development
    deno
    lua-language-server
    nil
    nixd
    nodejs
    vitejs
    vscode
    zed-editor
    typst
  ];

  programs.nix-ld = {
    enable = true;
    libraries = [
      # Add any missing dynamic libraries for unpackaged programs
      # here, NOT in environment.systemPackages
    ];
  };

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
