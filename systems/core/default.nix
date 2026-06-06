{ pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  environment.systemPackages = with pkgs; [
    bluetui
    clang
    curl
    git
    gh
    fastfetch
    fish
    fontconfig
    geoclue2
    kitty
    pipewire
    playerctl
    unzip
    upower
    vim
    wget
    wl-clipboard
    zip
  ];

  system.stateVersion = "25.11";
}
