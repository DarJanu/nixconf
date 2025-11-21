self: super: {
  gns3-gui = super.gns3-gui.overrideAttrs (old: rec {
    version = "2.2.55";
    src = super.fetchFromGitHub {
      owner = "GNS3";
      repo = "gns3-gui";
      rev = "v${version}";
      sha256 = "sha256-6jblQakNpoSQXfy5pU68Aedg661VcwpqQilvqOV15pQ="; # replace with actual hash
    };
  });
  gns3-server = super.gns3-server.overrideAttrs (old: rec {
    version = "2.2.55";
    src = super.fetchFromGitHub {
      owner = "GNS3";
      repo = "gns3-server";
      rev = "v${version}";
      sha256 = "sha256-o04RrHYsa5sWYUBDLJ5xgcK4iJK8CfZ4YdAiZ4eV/o4="; # replace with actual hash
    };
  });
}
