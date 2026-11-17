---@type LazySpec
return {
  {
    "lervag/vimtex",
    lazy = false, -- VimTeX must load at startup to set up filetype detection
    init = function()
      vim.g.vimtex_view_method = "zathura"

      -- Use latexmk with lualatex
      vim.g.vimtex_compiler_method = "latexmk"
      vim.g.vimtex_compiler_latexmk = {
        aux_dir = ".aux",
        out_dir = "",
        callback = 1,
        continuous = 1,
        executable = "latexmk",
        options = {
          "-verbose",
          "-file-line-error",
          "-synctex=1",
          "-interaction=nonstopmode",
        },
      }

      -- Let treesitter handle syntax (set to 0 to use VimTeX's own syntax instead)
      vim.g.vimtex_syntax_enabled = 1

      -- Disable insert mode mappings that conflict with snippet plugins
      vim.g.vimtex_imaps_enabled = 0

      -- Quickfix behaviour: open on warnings but don't focus
      vim.g.vimtex_quickfix_mode = 2
      vim.g.vimtex_quickfix_open_on_warning = 0

      -- Fold settings
      vim.g.vimtex_fold_enabled = 1
    end,
  },
}
