{ pkgs, inputs, ... }:
{
  imports = [
    inputs.home-manager.nixosModules.default
  ];

  users.users.killioiden = {
    isNormalUser = true;
    createHome = true;
    home = "/home/killioiden";
    description = "Killioiden";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    shell = pkgs.fish;
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    useGlobalPkgs = true;
    useUserPackages = true;
    users.killioiden.home = {
      packages = [ ];
      stateVersion = "26.05"; # no touchy
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

  };
}
