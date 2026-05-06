{pkgs, ...}: {
  environment.systemPackages = [
    pkgs.x11docker
    pkgs.xhost
  ];
  services.xserver.enable = true;
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  services.desktopManager.plasma6.enable = true;
}
