vim.g.mapleader = " "
local keymap = vim.keymap

keymap.set('n', 'x', '"_x')

-- Increment/decrement
-- keymap.set('n', '+', '<C-a>')
-- keymap.set('n', '-', '<C-x>')

-- Select all
keymap.set('n', '<C-a>', 'gg<S-v>G')

-- New tab
keymap.set('n', 'te', ':tabedit<Return>')

-- Split window
keymap.set('n', 'ss', ':split<Return><C-w>w')
keymap.set('n', 'sv', ':vsplit<Return><C-w>w')
-- Move window
keymap.set('n', '<Space>', '<C-w>w')
keymap.set('', 'sh', '<C-w>h')
keymap.set('', 'sk', '<C-w>k')
keymap.set('', 'sj', '<C-w>j')
keymap.set('', 'sl', '<C-w>l')
-- Resize window
keymap.set('n', '<C-w><left>', '<C-w><')
keymap.set('n', '<C-w><right>', '<C-w>>')
keymap.set('n', '<C-w><up>', '<C-w>+')
keymap.set('n', '<C-w><down>', '<C-w>-')

-- Salar's shortcuts
keymap.set('n', '<leader>pf', vim.cmd.Ex)
keymap.set('n', '<leader>n', '<Cmd>bn<CR>')
keymap.set('n', '<leader>p', '<Cmd>bp<CR>')
-- keymap.set('n', '<leader>q', '<Cmd>bp|sp|bn|bd<CR>')
keymap.set('n', '<leader>l', '<Cmd>ls<CR>')

-- local function get_listed_buffers_count()
--   local buffers = vim.api.nvim_list_bufs()
--   local listed_buffers = 0
--   for _, buf in pairs(buffers) do
--     --'bl': Boolean value indicating whether the buffer is listed in the buffer list.
--     --'bt': Returns buffer type. If it returns nil the type is a normal buffer.
--     if vim.api.nvim_buf_get_option(buf, 'bl') and
--         vim.api.nvim_buf_get_option(buf, 'bt') == nil then
--       listed_buffers = listed_buffers + 1
--     end
--   end
--   return listed_buffers
-- end
--
-- function CloseBufferAndOpenNetrwIfNoBuffers()
--   -- If the current buffer is the only listed buffer.
--   local open_explorer = get_listed_buffers_count() == 1
--   -- Use the nvim_command() function to execute the "bdelete" command, which closes the current buffer
--   vim.api.nvim_command("bdelete")
--
--
--   -- If the number of buffers is zero, open netrw
--   if open_explorer then
--     vim.cmd.Ex()
--   end
-- end
--
-- keymap.set("n", "<leader>q", ":lua CloseBufferAndOpenNetrwIfNoBuffers()<CR>", { silent = false })
--

function BufferDelete()
  if vim.api.nvim_buf_get_option(0, "modified") then
    vim.api.nvim_command("echohl ErrorMsg")
    vim.api.nvim_command("echomsg \"No write since last change. Not closing buffer.\"")
    vim.api.nvim_command("echohl NONE")
  else
    local total_nr_buffers = 0
    local n_bufs = vim.api.nvim_call_function("bufnr", { "$" })
    for i = 1, n_bufs do
      if vim.api.nvim_call_function("buflisted", { i }) then
        total_nr_buffers = total_nr_buffers + 1
      end
    end
    if total_nr_buffers == 1 then
      vim.api.nvim_command("bdelete")
      print("Buffer deleted. Created new buffer.")
    else
      vim.api.nvim_command("bprevious")
      vim.api.nvim_command("bdelete #")
      print("Buffer deleted.")
    end
  end
end

keymap.set("n", "<leader>q", ":lua BufferDelete()<CR>", { silent = false })
