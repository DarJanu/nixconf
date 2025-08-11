{
  config,
  pkgs,
  ...
}: {
  # Enable the X11 windowing system.
  # You can disable this if you're only using the Wayland session.
  services.xserver = {
    enable = true;

    desktopManager = {
      xterm.enable = false;
    };

    displayManager = {
      defaultSession = "none+i3";
    };

    windowManager.i3 = {
      enable = true;
      extraPackages = with pkgs; [
        dmenu #application launcher most people use
        i3blocks #if you are planning on using i3blocks over i3status
        feh
        conky
      ];
    };
  };
  programs.i3lock.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  #services.displayManager.sddm.enable = true;
  #services.desktopManager.plasma6.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "at";
    variant = "";
  };
  services.picom = {
    enable = true;
    fade = true;
    shadow = true;
    fadeDelta = 4;
    inactiveOpacity = 0.8;
    activeOpacity = 0.95;
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
