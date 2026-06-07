{ pkgs, ... }:
{
  home = {
    packages = [ ];
    stateVersion = "25.11";
    file.".config/hypr/.luarc.json" = {
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
  };
}
