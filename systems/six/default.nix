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
    bluetui
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
    signal-desktop
    steam
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
        wayland.enable = true;
      };
    };
    geoclue2.enable = true;
    upower.enable = true;
    power-profiles-daemon.enable = true;
  };

  system.stateVersion = "25.11";
}
