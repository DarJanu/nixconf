{
  config,
  pkgs,
  ...
}: {
  services.dbus.enable = true;

  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    wlr.enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal-wlr
    ];
  };

  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true; # so that gtk works properly
    extraPackages = with pkgs; [
      swaylock
      swayidle
      mako # notification daemon
      grim
      slurp
      wofi
      dmenu # Dmenu is the default in the config but i recommend wofi since its wayland native
    ];
  };

  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  programs.waybar.enable = true;
}
