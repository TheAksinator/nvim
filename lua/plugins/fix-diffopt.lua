-- Workaround: on Neovim nightly (0.12+/0.13-dev), `vim.opt.diffopt:get()` returns a
-- key/value map instead of a list. AstroNvim builds its default with
-- `vim.list_extend(vim.opt.diffopt:get(), {...})`, producing a mixed table that
-- Neovim refuses ("Invalid 'value': Cannot convert given Lua table"). That error
-- aborts astrocore's setup, so most options/mappings/autocmds never get applied.
-- Here we override it with a plain string. Safe to delete once AstroNvim fixes it.

---@type LazySpec
return {
  "AstroNvim/astrocore",
  opts = function(_, opts)
    opts.options = opts.options or {}
    opts.options.opt = opts.options.opt or {}
    local diffopt = vim.tbl_filter(
      function(item) return not item:match "^linematch:" and not item:match "^algorithm:" end,
      vim.split(vim.o.diffopt, ",", { trimempty = true })
    )
    vim.list_extend(diffopt, { "algorithm:histogram", "linematch:60" })
    opts.options.opt.diffopt = table.concat(diffopt, ",")
  end,
}
