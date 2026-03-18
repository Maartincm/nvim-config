-- Set default indentation to 4 spaces for most files
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

-- Use 2 spaces for specific file types using an Autocmd group
vim.api.nvim_create_augroup('CustomFileTypeIndentation', { clear = true })
vim.api.nvim_create_autocmd('FileType', {
  group = 'CustomFileTypeIndentation',
  pattern = { 'html', 'css', 'javascript', 'typescript', 'lua', 'yml', 'yaml', 'md' }, -- List of filetypes
  command = 'setlocal shiftwidth=2 tabstop=2 softtabstop=2',
})
