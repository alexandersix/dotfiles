return {
	{
		'VonHeikemen/lsp-zero.nvim',
		branch = "v3.x",
		dependencies = {
			-- LSP Support
			{ 'neovim/nvim-lspconfig' },
			{ 'williamboman/mason.nvim' },
			{ 'williamboman/mason-lspconfig.nvim' },
			{ 'lukas-reineke/lsp-format.nvim' },

			-- Autocompletion
			{ 'hrsh7th/nvim-cmp' },
			{ 'hrsh7th/cmp-buffer' },
			{ 'hrsh7th/cmp-path' },
			{ 'saadparwaiz1/cmp_luasnip' },
			{ 'hrsh7th/cmp-nvim-lsp' },
			{ 'hrsh7th/cmp-nvim-lua' },

			-- Styling
			{ 'onsails/lspkind.nvim' },

			-- Progress
			{
				"j-hui/fidget.nvim",
			},

			-- Snippets
			{ 'L3MON4D3/LuaSnip' },

			-- Snippet Collection (Optional)
			{ 'rafamadriz/friendly-snippets' },

			-- Null-ls
			{ "nvimtools/none-ls.nvim" },
		},
		config = function()
			require("fidget").setup({
				progress = {
					ignore = {
						'ltex', -- Fidget was receiving a message on *every* keystroke, so we ignore
					}
				}
			})

			local lsp_zero = require("lsp-zero")

			-- Automatic configuration of language servers
			require("mason").setup({})
			require('mason-lspconfig').setup({
				ensure_installed = {
					'astro',
					'bashls',
					'clangd',
					'cssls',
					'dockerls',
					'eslint',
					'gopls',
					'html',
					'intelephense',
					'jsonls',
					'ltex',
					'rust_analyzer',
					'sqlls',
					'lua_ls',
					'svelte',
					'tailwindcss',
					'tsserver',
					'vimls',
					'volar',
					'yamlls',
				},
				handlers = {
					lsp_zero.default_setup,
					ltex = function()
						require('lspconfig').ltex.setup({
							filetypes = { "vimwiki", "markdown", "md", "pandoc", "vimwiki.markdown.pandoc" },
							flags = { debounce_text_changes = 300 },
							settings = {
								ltex = {
									additionalRules = {
										enablePickyRules = true
									},
									trace = { server = "warning" }
								}
							}
						})
					end,
					lua_ls = function()
						-- Configured Lua LS for Nvim
						local lua_opts = lsp_zero.nvim_lua_ls()
						require('lspconfig').lua_ls.setup(lua_opts)
					end,
					tsserver = function()
						local result = vim.fn.systemlist("npm ls -g --depth=0")
						local location = string.format("%s/node_modules/@vue/typescript-plugin", result[1])

						require("lspconfig").tsserver.setup({
							root_dir = require("lspconfig.util").root_pattern("src/App.vue", "nuxt.config.ts",
								"nuxt.config.js"),
							init_options = {
								plugins = {
									{
										name = "@vue/typescript-plugin",
										location = location,
										languages = { "vue" }
									},
								},
							},
							filetypes = {
								"javascript",
								"javascriptreact",
								"json",
								"typescript",
								"typescriptreact",
								"vue",
							}
						})
					end,
					volar = function()
						require("lspconfig").volar.setup {}
					end
				}
			})

			-- Set configurations for when LSP attaches to a buffer
			lsp_zero.on_attach(function(client, bufnr)
				local opts = { buffer = bufnr, remap = false }
				local bind = vim.keymap.set

				local null_ls_sources = require("null-ls.sources")
				local ft = vim.bo[bufnr].filetype

				local has_null_ls = #null_ls_sources.get_available(ft, "NULL_LS_FORMATTING") > 0

				-- if client.server_capabilities.inlayHintProvider then
				-- 	vim.lsp.buf.inlay_hint(bufnr, true)
				-- end

				bind("n", "<leader>pp", function()
					vim.lsp.buf.format({
						async = true,
						bufnr = bufnr,
						filter = function(filterClient)
							if has_null_ls then
								return filterClient.name == "null-ls"
							else
								return true
							end
						end
					})
				end, opts)
				bind("n", "<leader>cD", function() vim.lsp.buf.declaration() end, opts)
				bind("n", "<leader>cd", function() vim.lsp.buf.definition() end, opts)
				bind("n", "<leader>ci", function() vim.lsp.buf.implementation() end, opts)
				bind("n", "<leader>cr", function() vim.lsp.buf.references() end, opts)
				bind("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
				bind("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
				bind("n", "<leader>K", function() vim.lsp.buf.hover() end, opts)
				bind("n", "K", function() vim.lsp.buf.hover() end, opts)
				bind("n", "<leader>ck", function() vim.diagnostic.open_float() end, opts)
				bind("n", "<leader>dk", function() vim.diagnostic.goto_prev({ border = "rounded" }) end, opts)
				bind("n", "<leader>dj", function() vim.diagnostic.goto_next({ border = "rounded" }) end, opts)
			end)

			-- Set up nvim-cmp
			local cmp = require("cmp")
			cmp.setup({
				completion = {
					completeopt = "menu,menuone,noinsert,noselect"
				},
				formatting = {
					fields = { 'abbr', 'kind', 'menu' },
					format = require('lspkind').cmp_format()
				},
				mapping = cmp.mapping.preset.insert({
					['<C-k>'] = cmp.mapping.select_prev_item(),
					['<C-j>'] = cmp.mapping.select_next_item(),
					['<CR>'] = cmp.mapping.confirm({ select = false })
				}),
				preselect = cmp.PreselectMode.None,
			})

			-- Set up format on save
			lsp_zero.format_on_save({
				format_opts = {
					async = true,
					timeout_ms = 10000,
				},
				servers = {
					-- ['intelephense'] = { "php" }, -- Can run instead of Pint
					-- ['astro'] = { "astro" },
					['lua_ls'] = { "lua" },
					["null-ls"] = { "javascript", "typescript", "svelte", "vue", "php", "markdown", "mdx",
						"blade" },
				}
			})

			local null_ls = require("null-ls")

			null_ls.setup({
				sources = {
					null_ls.builtins.formatting.prettier.with({
						extra_filetypes = { "astro", "svelte" }
					}),
					null_ls.builtins.formatting.blade_formatter,
					null_ls.builtins.formatting.phpcsfixer.with({
						condition = function(utils)
							return utils.root_has_file({ ".use-cs-fixer" })
						end
					}),
					null_ls.builtins.formatting.pint.with({
						condition = function(utils)
							return not utils.root_has_file({ ".use-cs-fixer" })
						end
					})
				},
			})
		end
	}
}
