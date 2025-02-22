return{
  "lervag/vimtex",
  lazy = false,     -- we don't want to lazy load VimTeX
  -- tag = "v2.15", -- uncomment to pin to a specific release
  init = function()
    -- VimTeX configuration goes here, e.g.
    vim.g.vimtex_view_method = "zathura"
    vim.g.vimtex_view_zathura = "zathura"
    --vim.g.vimtex_view_method = "sioyek"
    --vim.g.vimtex_view_sioyek_exe = "sioyek.exe"
    vim.g.vimtex_callback_progpath = "nvim"
    --vim.g.vimtex_callback_progpath = "/opt/nvim-linux64/bin/nvim"
    --vim.g.vimtex_view_general_viewer = '~/.local/bin/sumatrapdf.sh'
    --vim.g.vimtex_view_general_options = '-reuse-instance -forward-search @tex @line @pdf'
    vim.conceallevel = 2
    vim.g.tex_conceal = "abdmgs"
    --vim.g.vimtex_view_method = "general"
    --vim.g.vimtex_view_general_callback = "TermPDF"
    --vim.g.vimtex_view_automatic = 0
  end
}

