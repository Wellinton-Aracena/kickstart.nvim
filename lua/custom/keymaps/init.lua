-- Toggle horizontal terminal
function ToggleTerm()
  -- Look for an existing terminal window
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local buf = vim.api.nvim_win_get_buf(win)
    if vim.bo[buf].buftype == 'terminal' then
      vim.api.nvim_win_close(win, true)
      return
    end
  end

  -- If none found, open a horizontal terminal (e.g. 15 lines tall)
  vim.cmd '15split | terminal'
end

return {
  {
    vim.keymap.set('n', '<leader>tt', ToggleTerm, { desc = 'toggles horizontal terminal' }),
    vim.keymap.set('n', '<leader>bd', ':bd<CR>', { desc = 'Buffer delete ' }),
  },
}
