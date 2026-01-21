{pkgs, ...}: {
  programs.neovim = {
    enable = true;
    defaultEditor = true;

    configure = {
      customRC = ''
        set number
        syntax on
        filetype plugin indent on
      '';

      packages.myVimPackage = with pkgs.vimPlugins; {
        start = [
          vim-airline
          telescope-nvim
          fzf-lsp-nvim
          vim-lsp
          nvim-lspconfig
        ]; # Loaded automatically
        opt = [
        ]; # Optional plugins (none here)
      };
    };
  };
}
