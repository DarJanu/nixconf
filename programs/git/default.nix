{pkgs, ...}: {
  programs.git = {
    enable = true;
    config = {
      user.name = "DarJanu";
      user.email = "Jetti.Janu@gmail.com";
    };
  };
}
