{ pkgs, ... }:
{
  imports = [
    ./networking.nix
    ./hardware-configuration.nix
    ./fonts.nix

    ../../modules/locale.nix
    ../../modules/fonts.nix

    ../../users/killioiden
    #<home-manager/nixos>
  ];

  environment.systemPackages = with pkgs; [
    clang
    curl
    fastfetch
    firefox
    fish
    fontconfig
    geoclue2
    git
    gh
    home-manager
    kitty
    nil
    nixd
    pipewire
    playerctl
    unzip
    upower
    vim
    wget
    wl-clipboard
    zip
  ];

  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  hardware.bluetooth.enable = true;

  services = {
    displayManager = {
      sddm = {
        enable = true;
        wayland.enable = true;
      };
    };
    geoclue2.enable = true;
    upower.enable = true;
    power-profiles-daemon.enable = true;
  };

  programs = {
    niri.enable = true;
    fish.enable = true;
  };

  system.stateVersion = "25.11";
}
