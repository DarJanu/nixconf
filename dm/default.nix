{
  config,
  pkgs,
  ...
}: {
  programs.hyprland.enable = true;
  environment.systemPackages = with pkgs; [
    mako
    hyprpolkitagent
    hyprcursor
  ];
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd hyprland";
        user = "jetti";
      };
    };
  };
  programs.waybar.enable = true;
}
