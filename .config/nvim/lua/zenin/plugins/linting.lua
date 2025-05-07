return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			javascript = { "eslint_d" },
			typescript = { "eslint_d" },
			javascriptreact = { "eslint_d" },
			typescriptreact = { "eslint_d" },
			svelte = { "eslint_d" },
			python = { "pylint" },
		}

		-- Function to find the virtual environment and return the pylint path
		local function find_pylint()
			local root_dir = vim.fn.getcwd()
			local lsp_roots = vim.lsp.buf.list_workspace_folders()
			if #lsp_roots > 0 then
				root_dir = lsp_roots[1]
			end

			local venv_dirs = { ".venv", "venv" }

			for _, venv_dir in ipairs(venv_dirs) do
				local venv_path = root_dir .. "/" .. venv_dir
				local pylint_path = venv_path .. "/bin/pylint"
				if vim.fn.executable(pylint_path) == 1 then
					return pylint_path
				end
			end
			return "pylint"
		end

		-- Customize Pylint to use the dynamically found executable
		lint.linters.pylint = {
			cmd = find_pylint(), -- Dynamically find pylint
			stdin = true,
			args = {
				"--rcfile",
				vim.fn.getcwd() .. "/.pylintrc", -- Dynamic path to .pylintrc
				"--output-format",
				"text",
				"--msg-template",
				"{path}:{line}:{column}: {msg_id}: {msg} ({symbol})",
			},
			ignore_exitcode = true,
			parser = require("lint.parser").from_errorformat("%f:%l:%c: %m", {
				source = "pylint",
			}),
		}

		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				lint.try_lint()
			end,
		})

		vim.keymap.set("n", "<leader>l", function()
			lint.try_lint()
		end, { desc = "Trigger linting for current file" })
	end,
}
