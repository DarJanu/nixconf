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
          vim-airline
        ]; # Loaded automatically
        opt = []; # Optional plugins (none here)
      };
    };
  };
}
