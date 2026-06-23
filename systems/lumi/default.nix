{ pkgs, ... }:
{
  imports = [
    ./networking.nix
    ./hardware-configuration.nix
    ../core/default.nix
    ../modules/default.nix
    ../home-manager/default.nix
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

  system.stateVersion = "25.11";
}
