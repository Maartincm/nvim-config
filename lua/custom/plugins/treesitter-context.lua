-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

---@module 'lazy'
---@type LazySpec
return {
  {
    'nvim-treesitter/nvim-treesitter-context',
    config = function()
      require('treesitter-context').setup {
        enable = true,
        max_lines = 0, -- No limit on lines
        line_numbers = true,
        separator = nil, -- No separator
        trim_scope = 'outer',
        mode = 'cursor',
      }
    end,
    -- Ensure the main treesitter plugin is loaded first
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
  },
}
