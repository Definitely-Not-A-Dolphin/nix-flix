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
    # System Core
    alacritty
    appimage-run
    bluetui
    curl
    fastfetch
    fish
    fontconfig
    geoclue2
    gh
    git
    home-manager
    kitty
    pipewire
    playerctl
    unzip
    upower
    tree
    vim
    wget
    wl-clipboard
    zip

    # User Core
    kdePackages.dolphin
    firefox
    fuzzel
    spotify

    # Gaming
    prismlauncher
    steam

    # Communications
    element-desktop
    signal-desktop
    slack
    vesktop
    whatsapp-electron

    # WM
    hyprland
    hyprshot
    noctalia-shell
    nwg-displays
    wayland

    # Development
    cargo
    clippy
    clang
    deno
    lua-language-server
    nil
    nixd
    nodejs
    rustup
    rustc
    typst
    vitejs
    vscode
    zed-editor-fhs

    # Misc
    cmatrix
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
