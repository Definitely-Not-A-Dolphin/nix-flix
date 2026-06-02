{ pkgs, ... }:
{
  imports = [
    ./networking.nix
    ./hardware-configuration.nix
    ./fonts.nix

    ../../modules/default.nix

    ../../users/killioiden
    #<home-manager/nixos>
  ];

  environment.systemPackages = with pkgs; [
    bluetui
    bambu-studio
    clang
    curl
    deno
    fastfetch
    firefox
    fish
    fontconfig
    fuzzel
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
    wget
    wl-clipboard
    zed-editor
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
