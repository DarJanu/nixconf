{pkgs, ...}: {
  programs.neovim = {
    enable = true;

    configure = {
      customRC = ''
        set number
        syntax on
        filetype plugin indent on
      '';

      packages.myVimPackage = with pkgs.vimPlugins; {
        start = [
          lazy-nvim
        ]; # Loaded automatically
        opt = []; # Optional plugins (none here)
      };
    };
  };
}
