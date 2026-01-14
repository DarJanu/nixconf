{
  pkgs,
  pkgs-unstable,
  ...
}: {
  imports = [
    ./zsh
    ./git
    ./nvim
    ./vmtools
    ./arduinotools
  ];
  nixpkgs.overlays = [
    (import ../flakes/gns3-overlay.nix)
  ];
  services.onedrive.enable = true;
  services.fwupd.enable = true;
  programs = {
    steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      localNetworkGameTransfers.openFirewall = true;
    };
    firefox.enable = true;
  };
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  services.tailscale.enable = true;

  environment.systemPackages = with pkgs; [
    #random stuffs
    joplin
    pineflash
    thonny
    prusa-slicer
    gh
    gns3-gui
    gns3-server
    wireshark
    inetutils
    acpi
    alsa-utils
    bash
    wget
    alejandra
    playerctl
    pango
    networkmanagerapplet
    wofi
    kdePackages.dolphin
    transmission_4
    spotify
    mono
    gtk2
    gtk3
    gtk4
    cups
    jre
    mozillavpn
    docker-compose
    wine
    calibre
  ];
  fonts.packages = with pkgs; [
    powerline-fonts
    font-awesome
    nerd-fonts.jetbrains-mono
  ];
}
