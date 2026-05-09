{ pkgs, ... }:
{
  programs.hyprland = {
    enable = true;
    withUWSM = true;
    xwayland.enable = true;
  };

  programs.illogical-impulse = {
    enable = true;

    dotfiles = {
      fish.enable = true;
      kitty.enable = true;
      starship.enable = true;
    };

    hyprland.plugins = [
      pkgs.hyprlandPlugins.hyprbars
      pkgs.hyprlandPlugins.hyprexpo
    ];
  };
}
