{...}: {
  imports = [
    ./hardware-configuration.nix
  ];

  boot.initrd.kernelModules = ["pinctrl_tigerlake"];

  networking.hostName = "freemwork";
  networking.hostId = "deadbeef";

  hardware.sensor.iio.enable = true;

  services.openssh.enable = true;
}
