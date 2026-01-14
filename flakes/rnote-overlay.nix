self: super: {
  gns3-gui = super.rnote.overrideAttrs (old: rec {
    version = "0.13.1";
    src = super.fetchFromGitHub {
      owner = "flxzt";
      repo = "rnote";
      rev = "v${version}";
      sha256 = "sha256-EMxA5QqmIae/d3nUpwKjgURo0nOyaNbma8poB5mcQW0="; # replace with actual hash
    };
  });
}
