local has_telescope, telescope = pcall(require, "telescope")

if not has_telescope then
  local msg = "Telescope must be installed to use this functionality (https://github.com/nvim-telescope/telescope.nvim)"
  print(msg)
end

local go_commands= require('go-telescope.commands').commands

local M = {}
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")
local finders = require("telescope.finders")
local pickers = require("telescope.pickers")
local conf = require("telescope.config").values

function M.telescope()
  local commands = go_commands 
  pickers.new({}, {
    prompt_title = 'Go Commands',
    finder = finders.new_table {
      results = commands,
      entry_maker = function(entry)
        return {
          value = entry.func,
          display = entry.label,
          ordinal = entry.label .. "-" .. entry.desc,
        }
      end
    },
    sorter = conf.generic_sorter({}),
    attach_mappings = function(prompt_bufnr, map)
      map('i', '<CR>', function()
        local selection = action_state.get_selected_entry()
        actions.close(prompt_bufnr)
        selection.value()
      end)
      return true
    end
  }):find()
end
return M
