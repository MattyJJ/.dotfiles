vim.api.nvim_create_autocmd("VimLeave", {
    callback = function()
        vim.opt.guicursor = "a:ver25"
    end,
})


local uv = vim.loop
local file = vim.fn.expand("~/.config/nvim/lua/matt/colour.lua")

local handle = uv.new_fs_event()

handle:start(file, {}, vim.schedule_wrap(function(err)
    if err then return end
    vim.cmd("luafile " .. file)
end))

vim.api.nvim_create_autocmd("VimLeavePre", {
    callback = function()
        handle:stop()
        handle:close()
    end,
})
