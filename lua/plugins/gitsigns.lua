---@type LazySpec
return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    current_line_blame = true, -- inline blame (toggle with :Gitsigns toggle_current_line_blame)
    on_attach = function(bufnr)
      local gs = package.loaded.gitsigns
      local map = function(mode, lhs, rhs, desc)
        vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
      end

      -- Navigate hunks
      map("n", "]h", gs.next_hunk, "Next hunk")
      map("n", "[h", gs.prev_hunk, "Previous hunk")

      -- Stage / reset (revert) the current hunk
      map({ "n", "v" }, "<leader>hs", ":Gitsigns stage_hunk<CR>", "Stage hunk")
      map({ "n", "v" }, "<leader>hr", ":Gitsigns reset_hunk<CR>", "Reset (revert) hunk")

      -- Other handy actions
      map("n", "<leader>hu", gs.undo_stage_hunk, "Unstage hunk")
      map("n", "<leader>hS", gs.stage_buffer, "Stage buffer")
      map("n", "<leader>hp", gs.preview_hunk_inline, "Preview hunk inline")
      map("n", "<leader>hb", function() gs.blame_line { full = true } end, "Blame line")
      map("n", "<leader>hd", gs.diffthis, "Diff against index")
    end,
  },
}

