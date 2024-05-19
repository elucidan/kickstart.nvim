return {
  {
    lazy = false,
    priority = 1000,
    dir = '~/plugins/colorbuddy.nvim',
    config = function()
      vim.cmd.colorscheme 'gruvbox'
    end,
  },
  'Mofiqul/vscode.nvim',
  'morhetz/gruvbox',
  'mhinz/vim-janah',
  {
    'fynnfluegge/monet.nvim',
    name = 'monet',
    config = function()
      require('monet').setup {
        transparent_background = true,
        semantic_tokens = true,
        dark_mode = true,
        highlight_overrides = {},
        color_overrides = {},
        styles = {},
      }
    end,
  },
}
