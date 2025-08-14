{
  config,
  pkgs,
  ...
}: {
  services.dbus.enable = true;

  xdg.portal = {
    enable = true;
    extraPortals = [pkgs.xdg-desktop-portal-gtk];
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

  services.picom = {
    enable = true;
    fade = true;
    shadow = true;
    fadeDelta = 4;
    inactiveOpacity = 0.85;
    activeOpacity = 1;
    backend = "glx";
    settings = {
      blur = {
        #method = "dual_kawase";
        background = true;
        strength = 5;
      };
    };
  };
}
