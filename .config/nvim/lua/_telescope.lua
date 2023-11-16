-- local action_state = require('telescope.actions.state') -- runtime (Plugin) exists somewhere as lua/telescope/actions/state.lua
local telescope = require('telescope')
telescope.setup{
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
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    }
  }
}
--telescope.load_extension('fzf')
--telescope.load_extension('file_browser')


local mappings = {}
mappings.curr_buf = function() 
  local opt = require('telescope.themes').get_dropdown({height=10, previewer=false})
  require('telescope.builtin').current_buffer_fuzzy_find(opt)
end
return mappings
