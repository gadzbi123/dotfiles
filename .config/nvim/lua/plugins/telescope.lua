local telescope = require('telescope')
telescope.setup {
  defaults = {
    prompt_prefix = "$ ",
    mappings = {
      i = {
        --["<c-a>"] = function() print(vim.inspect(action_state.get_selected_entry())) end
      }
    }
  },
  extensions = {
    fzf = {
      fuzzy = true,                   -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true,    -- override the file sorter
      case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
      -- the default case_mode is "smart_case"
    }
  }
}

local mappings = {}
mappings.curr_buf = function()
  local opt = require('telescope.themes').get_dropdown({ height = 10, previewer = false })
  require('telescope.builtin').current_buffer_fuzzy_find(opt)
end

local findHiddenExcludingGit = { find_command = { 'rg', '--files', '--iglob', '!.git', '--hidden' } }
local builtin = require("telescope.builtin")

vim.keymap.set('n', '<leader>ff', function() builtin.find_files(findHiddenExcludingGit) end)
vim.keymap.set('n', '<leader>fg', builtin.live_grep)
-- vim.keymap.set('n', '<leader>fd', select_dir_for_grep, {})
vim.keymap.set("n", "<space>/", function()
builtin.grep_string({search = vim.fn.input("Grep > ")})
end)
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})

return mappings
