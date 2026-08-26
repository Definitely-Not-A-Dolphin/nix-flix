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
    kdePackages.okular

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
    rustc
    typst
    vitejs
    vscode
    zed-editor-fhs

    # Misc
    cmatrix
    fastfetch
    microfetch
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
