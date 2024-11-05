-- Highlight for a short time when yanking.
local autocmd = vim.api.nvim_create_autocmd
autocmd("TextYankPost", {
	desc = "Highlight when yanking text",
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- Autoformat on saving file.
 vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*",
        callback = function()
            vim.lsp.buf.format({ async = false })
        end
    })
