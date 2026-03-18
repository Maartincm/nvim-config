local builtin = require 'telescope.builtin'

local telescope_fuzzy_grep = function() builtin.grep_string { shorten_path = true, word_match = '-w', only_sort_text = true, search = '' } end

local telescope_find_files_into_fuzzy_grep = function()
  builtin.find_files {
    attach_mappings = function(prompt_bufnr)
      local actions = require 'telescope.actions'
      local action_state = require 'telescope.actions.state'
      actions.select_default:replace(function()
        local current_picker = action_state.get_current_picker(prompt_bufnr)
        local selections = current_picker:get_multi_selection()
        -- if no multi-selection, leverage current selection
        if vim.tbl_isempty(selections) then table.insert(selections, action_state.get_selected_entry()) end
        local paths = vim.tbl_map(function(e) return e.path end, selections)
        builtin.grep_string { search_dirs = paths, shorten_path = true, word_match = '-w', only_sort_text = true, search = '' }
        -- actions.close(prompt_bufnr)
        -- builtin.live_grep {
        --   search_dirs = paths,
        -- }
      end)
      -- true: attach default mappings; false: don't attach default mappings
      return true
    end,
  }
end

vim.keymap.set('n', '<leader>sp', telescope_find_files_into_fuzzy_grep, { desc = 'Find files and refine with fuzzy grep' })
vim.keymap.set('n', '<leader>so', telescope_fuzzy_grep, { desc = 'Perform a fuzzy grep' })
