{...}: {
  imports = [
    ./locale
    ./boot
    ./net
    ./desktop
    ./printing
    ./audio
    ./user
    ];

  system.stateVersion = "24.11";
}
