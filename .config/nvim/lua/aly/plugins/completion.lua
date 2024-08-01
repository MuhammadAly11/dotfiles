return {
    "hrsh7th/nvim-cmp",
    dependencies = {
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-cmdline",
    },
    config = function()
	local cmp = require("cmp")
	cmp.setup({
	    completion = { completeopt = 'menu,menuone,noinsert' }, -- don't know what this does
	    mapping = cmp.mapping.preset.insert({
		['<C-k>'] = cmp.mapping.select_prev_item(cmp_select),
		['<C-j>'] = cmp.mapping.select_next_item(cmp_select),
		['<C-y>'] = cmp.mapping.confirm { select = true }, -- why isn't working? becouse there was a source without installing it's plugin 
		["<C-e>"] = cmp.mapping.abort(), -- close completion window
		["<C-Space>"] = cmp.mapping.complete(),
	    }),
	    sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "buffer" }, -- text within current buffer
		{ name = "path" }, -- file system paths
	    })
	})
    end,
}
