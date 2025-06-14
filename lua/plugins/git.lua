return {
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },  -- load only when a file opens
    opts = function()
      local gs = require("gitsigns")

      return {
        signs = {               -- symbols in the sign column
          add          = { text = "│" },
          change       = { text = "│" },
          delete       = { text = "▁" },
          topdelete    = { text = "‾" },
          changedelete = { text = "▏" },
          untracked    = { text = "┆" },
        },

        on_attach = function(bufnr)
          -- helper to avoid repetition
          local map = function(mode, lhs, rhs, desc)
            vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
          end

          -- ▸ navigate between hunks
          map("n", "]c", function() gs.next_hunk() end,  "Next hunk")
          map("n", "[c", function() gs.prev_hunk() end,  "Prev hunk")

          -- ▸ stage / rollback (“reset”) the current hunk
          map({ "n", "v" }, "<leader>hs", ":Gitsigns stage_hunk<CR>",  "Stage hunk")
          map({ "n", "v" }, "<leader>hr", ":Gitsigns reset_hunk<CR>",  "Reset hunk")

          -- ▸ preview the hunk inline
          map("n", "<leader>hp", gs.preview_hunk_inline, "Preview hunk")

          -- ▸ toggle inline blame
          map("n", "<leader>hb", gs.toggle_current_line_blame, "Toggle line blame")
        end,
      }
    end,
  },
}

