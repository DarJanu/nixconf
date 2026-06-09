{pkgs, ...}: {
  environment.systemPackages = [
    pkgs.x11docker
    pkgs.xhost
  ];
  services.xserver.enable = true;
  # Enable Plasma
  services = {
    desktopManager.plasma6.enable = true;

    # Default display manager for Plasma
    displayManager.plasma-login-manager.enable = true;
  };
  stylix.enable = true;
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/brewer.yaml";
}
