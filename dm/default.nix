{
  config,
  pkgs,
  ...
}: {
  programs.hyprland.enable = true;
  environment.systemPackages = with pkgs; [
    mako
    hyprpolkitagent
  ];
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
