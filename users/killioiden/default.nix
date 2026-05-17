{ pkgs, ... }:
{
  users.users.killioiden = {
    isNormalUser = true;
    createHome = true;
    home = "/home/killioiden";
    description = "Killioiden";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    packages = # with pkgs;
      [ ];
    shell = pkgs.fish;
  };

  # home-manager.users.killioiden =
  #   { ... }:
  #   {
  #     home = {
  #       packages = [ ];
  #       stateVersion = "25.11";
  #     };
  #   };
}
