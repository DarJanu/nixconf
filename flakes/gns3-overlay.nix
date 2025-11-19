self: super: {
  gns3-gui = super.gns3-gui.overrideAttrs (old: rec {
    version = "2.2.55";
    src = super.fetchFromGitHub {
      owner = "GNS3";
      repo = "gns3-gui";
      rev = "v${version}";
      sha256 = "sha256-urof5f5nsX6kdDIhmVWyK76sEJxMPhYRqD7TXSnwV/A="; # replace with actual hash
    };
  });
}
