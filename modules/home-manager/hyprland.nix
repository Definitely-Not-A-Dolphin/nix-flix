{ pkgs, ... }:
{
  programs.hyprland = {
    enable = true;
    withUWSM = true;
    xwayland.enable = true;
  };

  home.file.".config/hypr/.luarc.json" = {
    text = builtins.toJSON {
      workspace = {
        library = [
          "${pkgs.hyprland}/share/hypr/stubs"
        ];
      };
      diagnostics = {
        globals = [ "hl" ];
      };
    };
  };
}
