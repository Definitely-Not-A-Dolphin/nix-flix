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
    #packages = with pkgs; [ ];
    shell = pkgs.fish;
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users.killioiden = {
      home = {
        packages = [ ];
        stateVersion = "25.11";
      };
      # andere dingen hier
    };
  };
}
