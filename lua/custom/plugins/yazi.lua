vim.pack.add {"https://github.com/mikavilpas/yazi.nvim"}

-- (Obtain yazi.nvim and its dependencies using your preferred method first)
--
-- Next, map a key to open yazi.nvim
vim.keymap.set("n", "\\", function()
  require("yazi").yazi()
end)

-- 👇 if you use `open_for_directories=true`, this is recommended.
--
-- mark netrw as loaded so it's not loaded at all.
-- More details: https://github.com/mikavilpas/yazi.nvim/issues/802
vim.g.loaded_netrwPlugin = 1
vim.api.nvim_create_autocmd("UIEnter", {
  callback = function()
    require("yazi").setup({
      open_for_directories = true,
    })
  end,
})

require("yazi").setup {
  -- Also:
  -- - use e.g. `open_file_in_tab = false` to disable a keymap
  -- - you can customize only some of the keymaps (not all of them)
  -- - you can opt out of all keymaps by setting `keymaps = false`
  keymaps = {
    show_help = "<f1>",
    open_file_in_vertical_split = "|",
    open_file_in_horizontal_split = "-",
    open_file_in_tab = "t",
    grep_in_directory = "<c-s>",
    replace_in_directory = "<c-g>",
    cycle_open_buffers = "<tab>",
    copy_relative_path_to_selected_files = "<c-y>",
    send_to_quickfix_list = "<c-q>",
    change_working_directory = "<c-\\>",
    open_and_pick_window = "<c-o>",
  },
}
