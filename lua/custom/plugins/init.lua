-- You can add your own plugins here or in other files in this directory!
--
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'akinsho/flutter-tools.nvim',
    lazy = false,
    dependencies = {
      'nvim-lua/plenary.nvim',
      'stevearc/dressing.nvim', -- optional for vim.ui.select
    },
    config = true,
  },
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope.nvim' },
    config = function()
      local harpoon = require 'harpoon'
      harpoon:setup()

      vim.keymap.set('n', '<leader>a', function()
        harpoon:list():add()
      end)
      vim.keymap.set('n', '<C-e>', function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end)

      -- Toggle previous & next buffers stored within Harpoon list
      vim.keymap.set('n', '<leader>hp', function()
        harpoon:list():prev()
      end)
      vim.keymap.set('n', '<leader>hn', function()
        harpoon:list():next()
      end)
    end,
  },
  {
    'elucidan/flutter-bloc.nvim',
    config = function()
      vim.keymap.set('n', '<Leader>cfb', "<cmd>lua require('flutter-bloc').create_bloc()<cr>", { desc = '[C]reate [F]lutter [B]loc' })
      vim.keymap.set('n', '<Leader>cfc', "<cmd>lua require('flutter-bloc').create_cubit()<cr>", { desc = '[C]reate [F]lutter [C]ubit' })
    end,
  },
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
