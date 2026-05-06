{...}: {
  imports = [
    ./locales
    ./boot
  ];

  nix.settings = {
    experimental-features = ["nix-command" "flakes"];
    max-substitution-jobs = 10;
    cores = 0;
  };
}
