local M = {}

function M.setup()
  --require('telescope').load_extension('go_commands')
  local picker = require("go-telescope.telescope").telescope
  vim.api.nvim_create_user_command('GoTelescope', picker, {})
end

return M
