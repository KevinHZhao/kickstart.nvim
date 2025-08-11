-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

vim.pack.add {
  { src = 'https://github.com/nvim-neo-tree/neo-tree.nvim', version = vim.version.range '*' },
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/MunifTanjim/nui.nvim',
}

vim.keymap.set('n', '\\', '<Cmd>Neotree reveal<CR>', { desc = 'NeoTree reveal', silent = true })

require('neo-tree').setup {
  filesystem = {
    window = {
      mappings = {
        ['\\'] = 'close_window',
      },
    },
    commands = {
      system_open = function(state)
        local node = state.tree:get_node()
        local path = node:get_id()
        -- macOs: open file in default application in the background.
        vim.fn.jobstart({ 'open', path }, { detach = true })
        -- Linux: open file in default application
        vim.fn.jobstart({ 'xdg-open', path }, { detach = true })

        -- Windows: Without removing the file from the path, it opens in code.exe instead of explorer.exe
        local p
        local lastSlashIndex = path:match '^.+()\\[^\\]*$' -- Match the last slash and everything before it
        if lastSlashIndex then
          p = path:sub(1, lastSlashIndex - 1) -- Extract substring before the last slash
        else
          p = path -- If no slash found, return original path
        end
        vim.cmd('silent !start explorer ' .. p)
      end,
    },
  },
}
