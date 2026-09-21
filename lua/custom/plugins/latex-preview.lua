vim.pack.add({
  { src = "https://github.com/folke/snacks.nvim" },
  { src = "https://github.com/sonv/latex-preview.nvim" },
})

require("snacks").setup({
  image = {
    enabled = true,

    doc = {
      enabled = true,
      inline = true,
      float = true,
      max_width=40,
      max_height=30,
    },

    math = {enabled = false}
  },
})

require("latex-preview").setup({
  enabled = true,
  filetypes = { "tex", "latex", "markdown", "rmd", "quarto" },
  setup_keymap = false,        -- install the toggle key automatically
  keymap = "<leader>ih",       -- the toggle key (or list of keys)

  -- Disk cache is off by default; live hover always uses temp files.
  -- Set cache = true to persist renders across sessions.
  cache = false,
  -- Where to write cached SVG/PNG files. Three forms:
  --   "aux" (default) — <texfile-dir>/aux/latex-preview-cache/
  --                     (falls back to stdpath cache for unsaved buffers)
  --   "/some/path"    — a fixed global directory for all buffers
  --   function(buf)   — called per buffer, return an absolute path
  cache_dir = "aux",

  daemon = {
    cmd = nil,                 -- override daemon command if needed
    max_restarts = 3,
    ready_timeout_ms = 8000,
  },

  extract = {
    scan_sty = true,           -- find macros in local .sty files
    sty_search_depth = 4,      -- walk up this many parent directories
    rewrite_providecommand = true,  -- MathJax compat
    rewrite_edef = true,       -- MathJax compat
  },

  render = {
    fg = function()            -- defaults to current Normal hl fg
      local hl = vim.api.nvim_get_hl(0, { name = "Normal" })
      if hl and hl.fg then return string.format("#%06x", hl.fg) end
      return "#000000"
    end,
    font_size = 12,            -- inline MathJax font size in pixels
    display_font_size = 12,    -- display MathJax font size in pixels
    display_math_style = "display", -- "display" for LaTeX display style, "text" for compact previews
    pad_to_cells = true,       -- prevent terminal-cell rounding from enlarging short equations
    density = 300,             -- DPI for SVG -> PNG
    svg_to_png = "auto",       -- "auto", "rsvg", or "magick"
  },

  popup = {
    -- Defaults to almost the full editor size. Lower these if you want
    -- long equations scaled down instead of opening a larger popup.
    max_width = nil,
    max_height = nil,
    live_update_delay_ms = 300,
  },

  hover = {
    auto_open = nil,        -- nil = follow Snacks image.doc.float
    toggle_keymap = "<leader>iH", -- runtime auto-hover toggle when setup_keymap=true
  },

  references = {
    enabled = true,         -- preview equations referenced by \ref, \eqref, \cref, ...
    toggle_keymap = "<leader>ir", -- runtime toggle when setup_keymap=true
  },

  theorem_references = {
    enabled = true,         -- preview labeled theorem/lemma/proposition/definition blocks
    toggle_keymap = "<leader>it", -- runtime toggle when setup_keymap=true
  },

  citations = {
    enabled = true,         -- preview BibTeX entries referenced by \cite... commands
    toggle_keymap = "<leader>ic", -- runtime toggle when setup_keymap=true
  },

  snacks = {
    -- Keep snacks.image available for the explicit popup, but disable
    -- Snacks' own document renderer that auto-renders every equation inline.
    disable_document_images = false,
    -- Empty Snacks' image cache on exit. The option name is kept for compatibility.
    clean_info_on_exit = true,
    -- Keep at most this many Snacks image cache entries, trimming oldest first.
    -- Set <=0 to disable.
    max_cache_files = 100,
    -- Also trim oldest cache groups when the directory exceeds this size.
    -- Set <=0 to disable.
    max_cache_bytes = 50 * 1024 * 1024,
    -- Never trim cache groups modified within this grace period.
    cache_grace_ms = 5000,
  },

  -- Note: popup sizing, border, padding, and similar visual options still
  -- come from your snacks.nvim image.doc config.
})
