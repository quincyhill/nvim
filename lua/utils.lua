local M = {}
local cmd = vim.cmd

-- Autocommands don't have a lua interface A.T.M. For now use `vim.api.nvim_command()` or the shorter `vim.cmd()`.

function M.create_augroup(autocmds, name)
        cmd('augroup' .. name)
        cmd('autocmd!')
        for _, autocmd in ipairs(autocmds) do
                cmd('autocmd' .. table.concat(autocmd, ' '))
        end
        cmd('augroup END')
end

return M
