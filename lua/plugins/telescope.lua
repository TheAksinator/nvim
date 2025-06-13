return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts =  {
        defaults = {
            file_ignore_patterns = {
                ".git",
                "target",
                "node_modules"
            },
        }
    },
    keys = {
        {
            "<leader>ff", 
            "<cmd>Telescope find_files<cr>", 
            desc = "Telescope Find Files"
        },
        {
            "<leader>fg", 
            "<cmd>Telescope live_grep<cr>", 
            desc = "Telescope Live Grep"
        },
    }
}
