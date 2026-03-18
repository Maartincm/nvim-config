-- Autocommand to trim trailing whitespace before saving a file
vim.api.nvim_create_autocmd('BufWritePre', {
  desc = 'Remove trailing whitespace on save',
  callback = function()
    -- Check if the buffer is modifiable (important for help buffers, etc.)
    if vim.bo.modifiable then
      -- Call the trim function from mini.trailspace
      require('mini.trailspace').trim()
    end
  end,
})
