-- Function to toggle global diagnostics visibility
local function cycle_through_diagnostics_modes()
  local new_config = {}
  local diagnostic_config = vim.diagnostic.config()
  if diagnostic_config and diagnostic_config.virtual_text then
    new_config = { virtual_text = false, virtual_lines = true }
  elseif diagnostic_config and diagnostic_config.virtual_lines then
    new_config = { virtual_text = false, virtual_lines = false }
  else
    new_config = { virtual_text = true, virtual_lines = false }
  end
  vim.diagnostic.config(new_config)
end

local function toggle_diagnostics()
  if vim.diagnostic.is_enabled() then
    vim.diagnostic.enable(false)
    print 'LSP diagnostics disabled'
  else
    vim.diagnostic.enable(true)
    print 'LSP diagnostics enabled'
  end
end

-- Map a key (e.g., <Leader>dt for "diagnostics toggle") to the function
vim.keymap.set('n', 'grc', cycle_through_diagnostics_modes, { desc = '[C]ycle through diagnostics display modes' })
vim.keymap.set('n', 'grT', toggle_diagnostics, { desc = '[T]oggle LSP diagnostics' })

-- Jump to next error, skipping warnings/info
vim.keymap.set('n', ']e', function() vim.diagnostic.jump { count = 1, severity = vim.diagnostic.severity.ERROR } end, { desc = 'Next Error' })

-- Jump to previous error, skipping warnings/info
vim.keymap.set('n', '[e', function() vim.diagnostic.jump { count = -1, severity = vim.diagnostic.severity.ERROR } end, { desc = 'Previous Error' })
