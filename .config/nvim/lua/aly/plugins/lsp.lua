return {
    "neovim/nvim-lspconfig",
    dependencies = {
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"hrsh7th/cmp-nvim-lsp",
    },
    config = function()

	local capabilities = require('cmp_nvim_lsp').default_capabilities()

	require("mason").setup()
	require("mason-lspconfig").setup({
	    ensure_installed = {
		"lua_ls",
		"pylsp",
	    },
	    automatic_installation = true,
	    handlers = {
		function(server_name) -- default handler (optional)
		    require("lspconfig")[server_name].setup {
			capabilities = capabilities
		    }
		end,
		["pyright"] = function ()
		    require("lspconfig").pyright.setup {
			settings = {
			    python = {
				analysis = {
				    typeCheckingMode = 'off'
				}
			    }
			}
		    }
		end,
	    }
	})

	vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
	vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
	vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
	vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
    end,
}
