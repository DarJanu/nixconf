{...}: {
  imports = [
    ./hardware-configuration.nix
  ];

  networking.hostName = "pc";
  networking.hostId = "deadbeef";

  services.openssh.enable = true;
}
