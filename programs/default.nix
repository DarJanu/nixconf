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
  #  nixpkgs.overlays = [
  #    (import ../flakes/rnote-overlay.nix)
  #  ];
  services.onedrive.enable = true;
  services.fwupd.enable = true;

  programs = {
    wireshark = {
      enable = true;
      dumpcap.enable = true;
      usbmon.enable = true;
    };
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

  security.wrappers.ubridge = {
    source = "${pkgs.ubridge}/bin/ubridge";
    owner = "root";
    group = "root";
    capabilities = "cap_net_admin,cap_net_raw+ep";
  };

  environment.systemPackages = with pkgs; [
    #random stuffs
    mediawriter
    screen
    ubridge
    vscode
    qtcreator
    python3
    nixd
    openscad
    freecad
    pineflash
    thonny
    prusa-slicer
    gh
    gns3-gui
    gns3-server
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
    wireshark
  ];
  fonts.packages = with pkgs; [
    powerline-fonts
    font-awesome
    nerd-fonts.jetbrains-mono
  ];
}
