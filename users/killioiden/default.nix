{ ... }:
{
  users.users.killioiden = {
    isNormalUser = true;
    description = "Killioiden";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    packages = [ ];
  };

  home-manager.users.killioiden =
    { ... }:
    {
      home.packages = [ ];
      home.stateVersion = "25.11";
    };
}
