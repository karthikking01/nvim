local M = {}

local function require_ok(module)
    local ok, result = pcall(require, module)
    if not ok then
        return nil
    end
    return result
end

function M.builtin(picker)
    return function()
        local builtin = require_ok('telescope.builtin')
        if builtin and builtin[picker] then
            builtin[picker]()
        end
    end
end

function M.extension(extension, picker)
    return function()
        local telescope = require_ok('telescope')
        if not telescope then
            return
        end

        pcall(telescope.load_extension, extension)
        local ext = telescope.extensions[extension]
        if ext and ext[picker] then
            ext[picker]()
        end
    end
end

return M
