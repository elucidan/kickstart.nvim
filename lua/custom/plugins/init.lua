-- You can add your own plugins here or in other files in this directory!
--
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    {
      'L3MON4D3/LuaSnip',
      -- follow latest release.
      version = 'v2.*', -- Replace <CurrentMajor> by the latest released major (first number of latest release)
      -- install jsregexp (optional!).
      build = 'make install_jsregexp',
      config = function()
        local ls = require 'luasnip'
        require('luasnip.loaders.from_vscode').lazy_load {
          paths = { './snippets/flutter-riverpod-snippets' },
          vim.keymap.set({ 'i' }, '<C-K>', function()
            ls.expand()
          end, { silent = true }),
          vim.keymap.set({ 'i', 's' }, '<C-L>', function()
            ls.jump(1)
          end, { silent = true }),
          vim.keymap.set({ 'i', 's' }, '<C-J>', function()
            ls.jump(-1)
          end, { silent = true }),

          vim.keymap.set({ 'i', 's' }, '<C-E>', function()
            if ls.choice_active() then
              ls.change_choice(1)
            end
          end, { silent = true }),
        }
      end,
    },
  },
}
