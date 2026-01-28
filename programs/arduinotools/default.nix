{pkgs, ...}: {
  environment.systemPackages = [
    pkgs.arduino-ide
  ];
  services.udev.extraRules = ''
    # Arduino Portenta H7 DFU mode
    ATTRS{idVendor}=="2341", ATTRS{idProduct}=="035b", MODE="0666"
    # STM32 DFU (general)
    ATTRS{idVendor}=="0483", ATTRS{idProduct}=="df11", MODE="0666"
  '';
}
