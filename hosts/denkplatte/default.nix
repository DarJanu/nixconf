{...}: {
  imports = [
    ./hardware-configuration.nix
  ];

  networking.hostName = "denkplatte";
  networking.hostId = "deadbeef";

  services.openssh.enable = true;
  services.openssh.allowSFTP = true;
  services.openssh.settings.PermitRootLogin = "yes";
}
