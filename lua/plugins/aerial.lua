-- AstroNvim v5 pins aerial.nvim to `^2.2`, but 2.x uses `iter_matches({ all = false })`,
-- which Neovim 0.12 removed, so opening a file errors with
-- "attempt to call method 'start' (a nil value)". aerial v3.1+/v4 fixes this.
-- v4 requires Neovim >= 0.12. Remove this file once AstroNvim bumps its pin.

---@type LazySpec
return {
  "stevearc/aerial.nvim",
  version = "^4",
}
