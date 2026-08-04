{ pkgs, ... }:
{
  imports = [
    ./networking.nix
    ./hardware-configuration.nix
    ../core/default.nix
    ../../modules/default.nix
  ];

  environment.systemPackages = with pkgs; [
    # General
    appimage-run
    kdePackages.dolphin
    firefox
    fuzzel
    home-manager
    spotify
    steam

    # Communications
    element-desktop
    signal-desktop
    slack
    vesktop
    whatsapp-electron

    # 3d printing
    orca-slicer

    # WM
    hyprland
    hyprshot
    hyprlock
    noctalia-shell
    nwg-displays
    wayland

    # Dev
    deno
    lua-language-server
    nil
    nixd
    nodejs
    vitejs
    vscode
    # zed-editor
    typst
  ];

  system.stateVersion = "25.11";
}
