{ pkgs, ... }:
{
  imports = [
    ./killioiden.nix
  ];

  nixpkgs.config.allowUnfree = true;

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  environment.systemPackages = with pkgs; [
    bluetui
    cargo
    clippy
    clang
    rustup
    rustc
    curl
    git
    gh
    fastfetch
    fish
    fontconfig
    geoclue2
    kitty
    m4
    pipewire
    playerctl
    unzip
    upower
    tree
    vim
    wget
    wl-clipboard
    zip
    zed-editor-fhs
    # zed
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
}
