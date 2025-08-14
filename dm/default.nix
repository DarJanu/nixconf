{
  config,
  pkgs,
  ...
}: {
  programs.hyprland.enable = true;

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd sway";
        user = "jetti";
      };
    };
  };
  programs.waybar.enable = true;
}
