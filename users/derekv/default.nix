{ pkgs, ... }:
{
  users.users.derekv = {
    isNormalUser = true;
    description = "Derek Verduijn";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];

    initialPassword = "changeme";
  };

  environment.systemPackages = with pkgs; [
    fastfetch
    kitty
    firefox
    vesktop
    vim
    wget
    curl
    zip
    unzip
    git
    zed-editor
    playerctl
    fish
    clang
    networkmanager
    geoclue2
    upower
  ];
}
