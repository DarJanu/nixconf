{pkgs, ...}: {
  imports = [
    ./zsh
    ./git
    ./nvim
    ./vmtools
    #    ./arduinotools
  ];
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
  nixpkgs.config.allowUnfree = true;
  services.tailscale.enable = true;

  security.wrappers.ubridge = {
    source = "${pkgs.ubridge}/bin/ubridge";
    owner = "root";
    group = "root";
    capabilities = "cap_net_admin,cap_net_raw+ep";
  };

  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    stdenv.cc.cc.lib
    zlib
    libGL
    xorg.libX11
    xorg.libXext
    xorg.libXrender
    xorg.libxcb
    xorg.libXau
    freetype
    nss
  ];

  programs.kdeconnect.enable = true;

  hardware.rtl-sdr.enable = true;
  services.flatpak.enable = true;
  environment.systemPackages = with pkgs; [
    minio-client
    cilium-cli
    talosctl
    kubectl
    kubernetes-helm
    nanovna-qt
    nanovna-saver
    sdrpp
    satdump

    root
    sofa
    julia-lts
    octave
    csxcad
    appcsxcad
    xnec2c
    kicad
    fritzing
    paraview
    librecad

    ckan

    proton-vpn
    cloudflared
    mediawriter
    screen
    ubridge
    vscode
    qtcreator
    python3
    nixd
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
    libgdiplus
    jre
    mozillavpn
    docker-compose
    wine
    calibre
    wireshark
    rawtherapee
  ];
  fonts.packages = with pkgs; [
    powerline-fonts
    font-awesome
    nerd-fonts.jetbrains-mono
  ];
}
