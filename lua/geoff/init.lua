print("hello from geoff")
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup(
{
	{
		'nvim-telescope/telescope.nvim', tag = '0.1.4',
		dependencies = { 'nvim-lua/plenary.nvim' }
	},
	{
		'nvim-treesitter/nvim-treesitter',
		build = ':TSUpdate',
		config = function ()
			local configs = require("nvim-treesitter.configs")

			configs.setup({
				ensure_installed = {"c", "cpp", "lua", "vim", "vimdoc", "javascript", "html" },
				sync_install = false,
				highlight = { enable = true },
				indent = { enable = true },
			})
		end
	}
})
require("telescopeRemap")
vim.wo.number = true
