{ pkgs, ... }:
{
  imports = [
    ../../killioiden/default.nix
    ../../modules/default.nix
    ./fonts.nix
    ./locale.nix
    ./sddm.nix
    ./services.nix
  ];

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    kernelParams = [
      "cfg80211.ieee80211_regdom=NL"
    ];
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };

  environment.systemPackages = with pkgs; [
    # System Core
    alacritty
    appimage-run
    bluetui
    curl
    firewalld
    fish
    ffmpeg
    fontconfig
    geoclue2
    gh
    git
    home-manager
    iw
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
    kdePackages.okular

    # User other
    spotify

    # Gaming
    r2modman
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
    clang
    deno
    lua
    lua-language-server
    nil
    nixd
    typst
    vscode
    zed-editor-fhs

    # Misc
    cmatrix
    fastfetch
    microfetch
  ];

  hardware.bluetooth.enable = true;

  networking.networkmanager.enable = true;

  nixpkgs.config.allowUnfree = true;

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
}
