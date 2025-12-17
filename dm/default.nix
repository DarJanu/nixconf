{
  config,
  pkgs,
  ...
}: {
  services.xserver.enable = true; # optional
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  #services.desktopManager.plasma6.enable = true;
  #  programs.hyprland.enable = true;
  #  environment.systemPackages = with pkgs; [
  #    mako
  #    hyprpolkitagent
  #    hyprcursor
  #  ];
  #  services.greetd = {
  #    enable = true;
  #    settings = {
  #      default_session = {
  #        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd hyprland";
  #        user = "jetti";
  #      };
  #    };
  #  };
  #  programs.waybar.enable = true;

  # Enable the COSMIC login manager
  #services.displayManager.cosmic-greeter.enable = true;

  # Enable the COSMIC desktop environment
  #services.desktopManager.cosmic.enable = true;
}
