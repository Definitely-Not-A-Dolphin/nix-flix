{ pkgs, ... }:
{
  imports = [
    ./networking.nix
    ./hardware-configuration.nix

    ../../modules/nixos/display
    ../../modules/nixos/locale.nix
    ../../modules/nixos/fonts.nix

    ../../users/killioiden
    <home-manager/nixos>
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
    hyprland
    kitty
    nil
    nixd
    pipewire
    playerctl
    unzip
    upower
    vesktop
    vim
    wireplumber
    wget
    wl-clipboard
    zed-editor
    zip
  ];

  services = {
    geoclue2.enable = true;
    upower.enable = true;
    power-profiles-daemon.enable = true;
  };

  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  hardware.bluetooth.enable = true;

  system.stateVersion = "25.11";
}
