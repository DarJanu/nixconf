{pkgs, ...}: {
  imports = [
    ./zsh
    ./git
    ./nvim
  ];
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

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
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
  ];
  fonts.packages = with pkgs; [
    powerline-fonts
    font-awesome
    nerd-fonts.jetbrains-mono
  ];
}
