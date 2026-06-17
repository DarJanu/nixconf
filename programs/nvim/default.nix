{pkgs, ...}: {
  programs.neovim = {
    enable = true;
    defaultEditor = true;

    configure = {
      customRC = ''
        lua << EOF
        -- Theme
        vim.cmd.colorscheme('base16-brewer')

        -- Options
        vim.opt.number = true
        vim.opt.relativenumber = true
        vim.opt.expandtab = true
        vim.opt.tabstop = 2
        vim.opt.shiftwidth = 2
        vim.opt.smartindent = true
        vim.opt.termguicolors = true
        vim.opt.updatetime = 250
        vim.opt.signcolumn = "yes"
        vim.opt.completeopt = { "menu", "menuone", "noselect" }

        -- Inline diagnostic messages
        vim.diagnostic.config({
          virtual_text  = { prefix = '●' },
          signs         = true,
          underline     = true,
          update_in_insert = false,
        })

        -- Snippets
        local luasnip = require('luasnip')
        require('luasnip.loaders.from_vscode').lazy_load()

        -- Completion
        local cmp = require('cmp')
        cmp.setup({
          snippet = {
            expand = function(args) luasnip.lsp_expand(args.body) end,
          },
          mapping = cmp.mapping.preset.insert({
            ['<C-b>']     = cmp.mapping.scroll_docs(-4),
            ['<C-f>']     = cmp.mapping.scroll_docs(4),
            ['<C-Space>'] = cmp.mapping.complete(),
            ['<C-e>']     = cmp.mapping.abort(),
            ['<CR>']      = cmp.mapping.confirm({ select = true }),
            ['<Tab>'] = cmp.mapping(function(fallback)
              if cmp.visible() then
                cmp.select_next_item()
              elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
              else
                fallback()
              end
            end, { 'i', 's' }),
            ['<S-Tab>'] = cmp.mapping(function(fallback)
              if cmp.visible() then
                cmp.select_prev_item()
              elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
              else
                fallback()
              end
            end, { 'i', 's' }),
          }),
          sources = cmp.config.sources(
            { { name = 'nvim_lsp' }, { name = 'luasnip' } },
            { { name = 'buffer' },   { name = 'path' } }
          ),
          experimental = { ghost_text = true },
        })

        -- LSP
        local capabilities = require('cmp_nvim_lsp').default_capabilities()

        vim.lsp.config('*', {
          capabilities = capabilities,
          on_attach = function(_, bufnr)
            local opts = { noremap = true, silent = true, buffer = bufnr }
            vim.keymap.set('n', 'gd',         vim.lsp.buf.definition,     opts)
            vim.keymap.set('n', 'K',          vim.lsp.buf.hover,          opts)
            vim.keymap.set('n', 'gi',         vim.lsp.buf.implementation, opts)
            vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename,         opts)
            vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action,    opts)
            vim.keymap.set('n', 'gr',         vim.lsp.buf.references,     opts)
            vim.keymap.set('n', '[d',         vim.diagnostic.goto_prev,   opts)
            vim.keymap.set('n', ']d',         vim.diagnostic.goto_next,   opts)
          end,
        })

        vim.lsp.enable({
          -- nix
          'nixd',
          -- lua / shell / python
          'lua_ls', 'pyright', 'bashls',
          -- c / c++ / assembly
          'clangd', 'asm_lsp',
          -- c#
          'csharp_ls',
          -- hdl
          'vhdl_ls', 'veridian',
          -- systems / web / misc
          'rust_analyzer', 'gopls',
          'ts_ls', 'html', 'cssls', 'jsonls', 'eslint',
          'yamlls', 'marksman',
        })

        -- Telescope
        local tb = require('telescope.builtin')
        vim.keymap.set('n', '<leader>ff', tb.find_files,  {})
        vim.keymap.set('n', '<leader>fg', tb.live_grep,   {})
        vim.keymap.set('n', '<leader>fb', tb.buffers,     {})
        vim.keymap.set('n', '<leader>fh', tb.help_tags,   {})
        EOF
      '';

      packages.myVimPackage = with pkgs.vimPlugins; {
        start = [
          vim-airline
          telescope-nvim
          plenary-nvim
          base16-nvim
          nvim-lspconfig
          nvim-cmp
          cmp-nvim-lsp
          cmp-buffer
          cmp-path
          luasnip
          cmp_luasnip
          friendly-snippets
        ];
      };
    };
  };

  environment.systemPackages = with pkgs; [
    # already-present servers
    lua-language-server
    pyright
    bash-language-server
    nixd
    # c / c++ / assembly
    clang-tools
    asm-lsp
    # c#
    csharp-ls
    # hdl
    vhdl-ls
    veridian
    # systems / web / misc
    rust-analyzer
    gopls
    typescript-language-server
    typescript
    nodejs
    vscode-langservers-extracted
    yaml-language-server
    marksman
  ];
}
