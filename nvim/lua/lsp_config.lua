local nvim_lsp = require'nvim_lsp'

-- :LspInstall tsserver
nvim_lsp.tsserver.setup{ on_attach=require'completion'.on_attach }

-- :LspInstall intelephense
nvim_lsp.intelephense.setup{ on_attach=require'completion'.on_attach }

-- https://github.com/golang/tools/tree/master/gopls
nvim_lsp.gopls.setup{ on_attach=require'completion'.on_attach }

-- :LspInstall cssls
nvim_lsp.cssls.setup{ on_attach=require'completion'.on_attach }

-- :LspInstall bashls
nvim_lsp.bashls.setup{ on_attach=require'completion'.on_attach }

-- :LspInstall dockerls
nvim_lsp.dockerls.setup{ on_attach=require'completion'.on_attach }

-- https://github.com/hashicorp/terraform-ls/releases
nvim_lsp.terraformls.setup{ on_attach=require'completion'.on_attach }

-- :LspInstall yamlls
nvim_lsp.yamlls.setup{ on_attach=require'completion'.on_attach }

-- :LspInstall vimls
nvim_lsp.vimls.setup{ on_attach=require'completion'.on_attach }

-- :LspInstall html
nvim_lsp.html.setup{ on_attach=require'completion'.on_attach }

-- :LspInstall jdtls
nvim_lsp.jdtls.setup{ on_attach=require'completion'.on_attach }

-- pip install python-language-server
nvim_lsp.pyls.setup{ on_attach=require'completion'.on_attach }

-- :LspInstall jsonls
nvim_lsp.jsonls.setup{ on_attach=require'completion'.on_attach }

-- :LspInstall sqlls
nvim_lsp.sqlls.setup{ on_attach=require'completion'.on_attach }

-- :LspInstall eslintls
--nvim_lsp.eslintls.setup{}

-- :LspInstall diagnosticls
nvim_lsp.diagnosticls.setup{
	filetypes = { "javascript", "javascript.jsx" },
	init_options = {
		filetypes = {
			javascript = "eslint",
			["javascript.jsx"] = "eslint",
			javascriptreact = "eslint",
			typescriptreact = "eslint",
		},
		linters = {
			eslint = {
				sourceName = "eslint",
				command = "./node_modules/.bin/eslint",
				rootPatterns = { ".git" },
				debounce = 100,
				args = {
					"--stdin",
					"--stdin-filename",
					"%filepath",
					"--format",
					"json",
				},
				parseJson = {
					errorsRoot = "[0].messages",
					line = "line",
					column = "column",
					endLine = "endLine",
					endColumn = "endColumn",
					message = "${message} [${ruleId}]",
					security = "severity",
				};
				securities = {
					[2] = "error",
					[1] = "warning"
				}
			}
		}
	}
}
