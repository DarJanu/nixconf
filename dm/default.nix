{pkgs, ...}: {
  environment.systemPackages = [
    pkgs.x11docker
    pkgs.xhost
  ];
  services.xserver.enable = true;
  services.xserver.desktopManager.cinnamon.enable = true;
  services.xserver.displayManager.lightdm.enable = true;
}
