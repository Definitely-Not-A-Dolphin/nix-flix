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

    # WM
    hyprland
    noctalia-shell

    # coding
    clang
    deno
    git
    gh
    lua-language-server
    nil
    nixd
    zed-editor

    bluetui
    curl
    fastfetch
    firefox
    fish
    fontconfig
    fuzzel
    geoclue2
    home-manager
    kitty
    signal-desktop
    spotify
    steam
    pipewire
    playerctl
    unzip
    upower
    vesktop
    vim
    wayland
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
    geoclue2.enable = true;
    upower.enable = true;
    power-profiles-daemon.enable = true;
  };

  system.stateVersion = "25.11";
}
