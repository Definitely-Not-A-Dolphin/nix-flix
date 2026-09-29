{
  config,
  inputs,
  pkgs,
  ...
}:
{
  imports = [
    inputs.home-manager.nixosModules.default
    ./alacritty.nix
    ./fastfetch.nix
    ./fish.nix
    ./fuzzel.nix
    ./noctalia.nix
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
    backupFileExtension = "bckp";
    extraSpecialArgs = { inherit inputs; };
    useGlobalPkgs = true;
    useUserPackages = true;
    users.killioiden.home = {
      packages = [ ];
      stateVersion = "26.05"; # no touchy
      file = {
        ".config/hypr/.luarc.json".text = builtins.toJSON {
          workspace.library = [
            "${pkgs.hyprland}/share/hypr/stubs"
          ];
          diagnostics.globals = [ "hl" ];
        };
        "openxr/1/active_runtime.json" = {
          force = true;
          text = builtins.toJSON {
            file_format_version = "1.0.0";
            runtime = {
              VALVE_runtime_is_steamvr = true;
              library_path = "${config.users.users.killioiden.home}/SteamVR/bin/linux64/vrclient.so";
              name = "SteamVR";
            };
          };
        };
      };
    };
  };
}
