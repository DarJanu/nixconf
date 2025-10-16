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
          fugitive
          nerdtree
          vim-airline
          nvim-treesitter
          mason-nvim
          nvim-lspconfig
          nvim-treesitter-parsers.nasm
          nvim-treesitter-parsers.c
          nvim-treesitter-parsers.python
          nvim-treesitter-parsers.nix
        ]; # Loaded automatically
        opt = []; # Optional plugins (none here)
      };
    };
  };
}
