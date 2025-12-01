vim.api.nvim_create_autocmd("VimLeave", {
    callback = function()
        vim.opt.guicursor = "a:ver25"
    end,
})


local uv = vim.loop
local file = vim.fn.expand("~/.config/nvim/lua/matt/colour.lua")
local last_mod = 0

local timer = uv.new_timer()
timer:start(0, 100, vim.schedule_wrap(function()
    local stat = uv.fs_stat(file)
    if not stat then return end

    if stat.mtime.sec ~= last_mod then
        last_mod = stat.mtime.sec
        vim.cmd("luafile " .. file)
    end
end))

vim.api.nvim_create_autocmd("VimLeavePre", {
    callback = function()
        timer:stop()
        timer:close()
    end,
})
