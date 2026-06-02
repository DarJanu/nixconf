{
  config,
  pkgs,
  inputs,
  ...
}: {
  # Define a user account.
  users.users.jetti = {
    isNormalUser = true;
    description = "Jetthaichal Janu";
    extraGroups = ["networkmanager" "plugdev" "wheel" "libvirtd" "docker" "ubridge" "dialout" "wireshark"];
    packages = with pkgs; [
      kdePackages.kate
      kitty
      obsidian
      hugo
      vlc
      qbittorrent
      blender
      libreoffice-qt
      hunspell
      krita
      inkscape
      gimp
      rnote
      tradingview
      claude-code
    ];
    shell = pkgs.zsh;
  };
  services.udisks2.enable = true;
  services.xserver.xkb.layout = "at";
  # Use same config for linux console
  console.useXkbConfig = true;
  systemd.user.services.xhost-docker = {
    description = "Allow Docker containers to access X11";
    wantedBy = ["default.target"];
    after = ["graphical-session.target"];
    serviceConfig = {
      ExecStart = "${pkgs.xhost}/bin/xhost +local:docker";
    };
  };
}
