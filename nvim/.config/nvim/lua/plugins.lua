local key = vim.keymap.set
local keyt = { noremap = true, silent = true }

-- function to check if current project is standalone luau or for roblox
local function rojo_project()
  return vim.fs.root(0, function(name)
    return name:match ".+%.project%.json$"
  end)
end

local plugins = {
	{
		'kevinhwang91/nvim-ufo',
		dependencies = { 'kevinhwang91/promise-async' },
		config = function()
			local handler = function(virtText, lnum, endLnum, width, truncate)
				local newVirtText = {}
				local suffix = (' 󰁂 %d '):format(endLnum - lnum)
				local sufWidth = vim.fn.strdisplaywidth(suffix)
				local targetWidth = width - sufWidth
				local curWidth = 0
				for _, chunk in ipairs(virtText) do
					local chunkText = chunk[1]
					local chunkWidth = vim.fn.strdisplaywidth(chunkText)
					if targetWidth > curWidth + chunkWidth then
						table.insert(newVirtText, chunk)
					else
						chunkText = truncate(chunkText, targetWidth - curWidth)
						local hlGroup = chunk[2]
						table.insert(newVirtText, {chunkText, hlGroup})
						chunkWidth = vim.fn.strdisplaywidth(chunkText)
						-- str width returned from truncate() may less than 2nd argument, need padding
						if curWidth + chunkWidth < targetWidth then
							suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
						end
						break
					end
					curWidth = curWidth + chunkWidth
				end
				table.insert(newVirtText, {suffix, 'MoreMsg'})
				return newVirtText
			end

			vim.o.foldcolumn = '0'
			vim.o.foldlevel = 99
			vim.o.foldlevelstart = 99
			vim.o.foldenable = true

			vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
			vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities.textDocument.foldingRange = {
				dynamicRegistration = false,
				lineFoldingOnly = true
			}
			local language_servers = vim.lsp.get_clients() -- or list servers manually like {'gopls', 'clangd'}
			for _, ls in ipairs(language_servers) do
				require('lspconfig')[ls].setup({
					capabilities = capabilities
				})
			end
			require('ufo').setup({
				fold_virt_text_handler = handler
			})
		end
	},
	{
		"lopi-py/luau-lsp.nvim",
		opts = {
			platform = {
				type = rojo_project() and "roblox" or "standard",
			},
			types = {
				roblox_security_level = "PluginSecurity",
			},
			sourcemap = {
				enabled = true,
				autogenerate = true,
				rojo_project_file = "default.project.json",
				sourcemap_file = "sourcemap.json",
			},
			plugin = {
				enabled = true,
				port = 3667,
			},
			fflags = {
				enable_new_solver = true, -- enables the flags required for luau's new type solver
			},
			server = {
				settings = {
					['luau-lsp'] = {
						completion = {
							imports = {
								ignoreGlobs = { "**/_Index/**" },
								enabled = true
							}
						}
					}
				}
			}
		},
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},
	{
		"kylechui/nvim-surround",
		version = "^3.0.0", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end
	},
	{
		"saghen/blink.cmp",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"rafamadriz/friendly-snippets",
			"onsails/lspkind.nvim",
		},
		version = "*",
		opts = {
			signature = {
				window = {
					show_documentation = false,
					border = "single",
				},
				enabled = true,
			},
			completion = {
				documentation = {
					window = { border = "single" },
					auto_show = true,
					auto_show_delay_ms = 500,
				},
				menu = {
					draw = {
						components = {
							kind_icon = {
								ellipsis = false,
								text = function(ctx)
									local lspkind = require("lspkind")
									local icon = ctx.kind_icon
									if vim.tbl_contains({ "Path" }, ctx.source_name) then
										local dev_icon, _ = require("nvim-web-devicons").get_icon(ctx.label)
										if dev_icon then icon = dev_icon end
									else
										icon = lspkind.symbolic(ctx.kind, {
											mode = "symbol",
										})
									end

									return icon .. ctx.icon_gap
								end,

								-- Optionally, use the highlight groups from nvim-web-devicons
								-- You can also add the same function for `kind.highlight` if you want to
								-- keep the highlight groups in sync with the icons.
								highlight = function(ctx)
									local hl = ctx.kind_hl
									if vim.tbl_contains({ "Path" }, ctx.source_name) then
										local dev_icon, dev_hl = require("nvim-web-devicons").get_icon(ctx.label)
										if dev_icon then hl = dev_hl end
									end
									return hl
								end,
							},
						},
						treesitter = { "lsp" },
						columns = { { "kind_icon", "label", gap = 1 }, { "kind" } },
					},
				},
			},
			keymap = {
				preset = "default",
				["<C-e>"] = { "select_and_accept", "fallback" },
				["<C-y>"] = { "select_and_accept", "fallback" },
				["<C-space>"] = { "show", "show_documentation", "hide", "hide_documentation" },
			},
			appearance = {
				use_nvim_cmp_as_default = true,
				nerd_font_variant = "normal",
			},
			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
				providers = {
					lazydev = {
						name = "LazyDev",
						module = "lazydev.integrations.blink",
						-- make lazydev completions top priority (see `:h blink.cmp`)
						score_offset = 100,
					},
					path = {
						opts = {
							get_cwd = function(_) return vim.fn.getcwd() end,
						}
					},
				},
			},
			fuzzy = { implementation = "prefer_rust_with_warning" },
		},
	},
	{
		"ibhagwan/fzf-lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			local fzf = require("fzf-lua")

			key('n', "<leader>ff", fzf.files, keyt)
			key('n', "<leader>fr", fzf.oldfiles, keyt)
			key('n', "<leader>f\\", fzf.builtin, keyt)
			key('n', "<C-/>", fzf.lgrep_curbuf, keyt)
			key('n', "<C-S-/>", fzf.live_grep, keyt)

			key('n', "<leader>fgb", fzf.git_branches, keyt)
			key('n', "<leader>fgs", fzf.git_status, keyt)
			key('n', "<leader>fgd", fzf.git_diff, keyt)

			key('n', "<leader>fe", fzf.lsp_finder, keyt)
			key('n', "<leader>fd", fzf.diagnostics_document, keyt)
			key('n', "<leader>fD", fzf.diagnostics_workspace, keyt)

			key('n', '<leader>f\"', fzf.registers, keyt)
			key('n', '<leader>fm"', fzf.registers, keyt)
		end,
		opts = {
			winopts = {
				border = "bold",
				preview = {
					border = "bold"
				}
				-- - "bold": Bold line box.
				-- - "double": Double-line box.
				-- - "none": No border.
				-- - "rounded": Like "single", but with rounded corners ("╭" etc.).
				-- - "shadow": Drop shadow effect, by blending with the background.
				-- - "single": Single-line box.
				-- - "solid": Adds padding by a single whitespace cell.
			}
		}
	},
	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"sindrets/diffview.nvim",
			"ibhagwan/fzf-lua"
		}
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		opts = {
			transparent_background = true
		}
	},
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {}
	},
	{
		'nvim-treesitter/nvim-treesitter',
		lazy = false,
		branch = 'main',
		build = ':TSUpdate'
	},
	{
		'windwp/nvim-autopairs',
		event = "InsertEnter",
		opts = {}
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		---@module "ibl"
		---@type ibl.config
		opts = {
			scope = {
				show_start = false,
				show_end = false
			}
		},
	},
	{
		'stevearc/conform.nvim',
		opts = {
			format_on_save = {
				timeout_ms = 500,
				lsp_format = "fallback",
			},
			formatters_by_ft = {
				lua = { "stylua" },
			},
			notify_no_formatters = false
		},
	},
	{
		"j-hui/fidget.nvim",
		tag = "v1.6.1",
		opts = {},
	},
	{
		'stevearc/oil.nvim',
		---@module 'oil'
		---@type oil.SetupOpts
		dependencies = { "nvim-tree/nvim-web-devicons" },
		lazy = false,
		config = function()
			key("n", "<leader>o", "<CMD>Oil<CR>", { desc = "Open parent directory" })
			require('oil').setup {
				-- default_file_explorer = true,
			}
		end
	}
}

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out,                            "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup {
	spec = {
		plugins
	},
	defaults = {
		lazy = false,
		version = false
	},
	install = { colorscheme = { "catppuccin-mocha" } },
	checker = {
		enabled = true,
		notify = false,
	}
}
vim.cmd.colorscheme("catppuccin-mocha")
