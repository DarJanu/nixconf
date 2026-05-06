{...}: {
  imports = [
    ./hardware-configuration.nix
  ];

  boot.initrd.kernelModules = ["pinctrl_tigerlake"];

  networking.hostName = "freemwork";
  networking.hostId = "deadbeef";
  networking.networkmanager.enable = true;

  hardware.sensor.iio.enable = true;

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

  system.stateVersion = "25.05";
}
