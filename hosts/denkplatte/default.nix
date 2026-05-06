{...}: {
  imports = [
    ./hardware-configuration.nix
  ];

  networking.hostName = "denkplatte";
  networking.hostId = "deadbeef";
  networking.networkmanager.enable = true;

  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;

  services.printing.enable = true;

  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  services.openssh.enable = true;
  services.openssh.allowSFTP = true;
  services.openssh.settings.PermitRootLogin = "yes";

  system.stateVersion = "25.05";
}
