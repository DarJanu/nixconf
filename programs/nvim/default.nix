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
        start = [fugitive nerdtree vim-airline nvim-treesitter]; # Loaded automatically
        opt = []; # Optional plugins (none here)
      };
    };
  };
}
