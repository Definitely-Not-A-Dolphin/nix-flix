{ pkgs, ... }:
{
  fonts.packages = with pkgs; [
    jetbrains-mono
    material-symbols
    rubik
    twitter-color-emoji
  ];
}
