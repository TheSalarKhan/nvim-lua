-- This function sets the default color scheme and
-- sets a transparent background.
function SetTheme()
  -- vim.cmd.colorscheme("rose-pine")
  -- set night as the colortheme
  local night = require('night')
  night.setup()

  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

SetTheme()
-- print("Loaded colors")
