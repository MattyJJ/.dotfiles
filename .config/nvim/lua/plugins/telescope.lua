return {
    "nvim-telescope/telescope.nvim",

    config = function()
        require("telescope").setup()

        local builtin = require("telescope.builtin")
        nremap("<leader>ff", function() builtin.find_files() end)
        nremap("<leader>fg", function() builtin.live_grep() end)
    end
}
