{pkgs, ...}: {
  imports = [
    ./zsh
    ./git
    ./nvim
    ./vmtools
    #    ./arduinotools
  ];

  programs.appimage = {
    enable = true;
    binfmt = true; # lets you run ./Foo.AppImage directly
  };

  services.fwupd.enable = true;
  services.cloudflare-warp.enable = true;
  programs.fuse.enable = true;
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
    bzip2
    libGL
    nss
    nspr
    libX11
    libXcomposite
    libXdamage
    libXfixes
    libXrandr
    libXtst
    libXext
    libXrender
    libxcb
    libXau
    libxkbcommon
    expat
    dbus
    alsa-lib
    glib
    krb5
    xcbutilwm
    xcbutilimage
    xcbutilkeysyms
    xcbutilrenderutil
  ];

  programs.kdeconnect.enable = true;

  hardware.rtl-sdr.enable = true;
  services.flatpak.enable = true;
  environment.systemPackages = with pkgs; [
    cloudflare-warp

    mesa
    vulkan-tools

    nanovna-qt
    nanovna-saver

    kicad
    fritzing
    screen

    julia

    fuse3
    sshfs

    ubridge
    vscode
    python3
    nixd
    freecad
    gh
    acpi
    alsa-utils
    bash
    wget
    alejandra
    playerctl
    networkmanagerapplet
    kdePackages.dolphin
    transmission_4
    spotify
    mono
    gtk3
    gtk4
    cups
    libgdiplus
    jre
    mozillavpn
    docker-compose
    wine
    wireshark
    rawtherapee
  ];
  fonts.packages = with pkgs; [
    powerline-fonts
    font-awesome
    nerd-fonts.jetbrains-mono
  ];
}
