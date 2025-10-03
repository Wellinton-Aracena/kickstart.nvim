-- Toggle horizontal terminal
function ToggleTerm()
  -- Toggle default terminal: open or fully exit
  -- Find a terminal buffer
  local term_buf = nil
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if vim.bo[buf].buftype == 'terminal' then
      term_buf = buf
      break
    end
  end

  if term_buf then
    -- Kill the terminal buffer completely
    vim.api.nvim_buf_delete(term_buf, { force = true })
  else
    -- No terminal yet → open a new one
    vim.cmd '15split | terminal'
  end
end

return {
  {
    vim.keymap.set('n', '<leader>tt', ToggleTerm, { desc = 'Toggles Horizontal Terminal' }),
    vim.keymap.set('n', '<leader>bd', ':bd<CR>', { desc = 'Buffer delete' }),
  },
}
