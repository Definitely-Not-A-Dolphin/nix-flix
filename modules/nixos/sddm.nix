{ ... }:
{
  #### sddm is dat ene login dingetje
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };
}
