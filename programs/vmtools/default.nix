{pkgs, ...}: {
  programs.virt-manager.enable = true;
  virtualisation.libvirtd.enable = true;
  virtualisation.spiceUSBRedirection.enable = true;
  virtualisation.docker.enable = true;
  environment.systemPackages = [
    pkgs.virtiofsd
  ];
}
