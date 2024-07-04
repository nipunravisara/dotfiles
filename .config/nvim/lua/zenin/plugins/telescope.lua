return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
    "folke/todo-comments.nvim",
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    local transform_mod = require("telescope.actions.mt").transform_mod
    local telescope_builtin = require("telescope.builtin")
    local trouble = require("trouble")
    local telescope_themes = require("telescope.themes")
    local trouble_telescope = require("trouble.sources.telescope").open

    -- or create your custom action
    local custom_actions = transform_mod({
      open_trouble_qflist = function(prompt_bufnr)
        trouble.toggle("quickfix")
      end,
    })

    telescope.setup({
      defaults = {
        path_display = { "smart" },
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous, -- move to prev result
            ["<C-j>"] = actions.move_selection_next, -- move to next result
            ["<C-q>"] = actions.send_selected_to_qflist + custom_actions.open_trouble_qflist,
            ["<C-t>"] = trouble_telescope,
          },
        },
      },
    })

    telescope.load_extension("fzf")

    local function telescope_live_grep_open_files()
      telescope_builtin.live_grep({
        grep_open_files = true,
        prompt_title = "Live Grep in Open Files",
      })
    end

    -- set keymaps
    local keymap = vim.keymap -- for conciseness

    keymap.set("n", "<leader>s/", telescope_live_grep_open_files, { desc = "[S]earch [/] in Open Files" })
    keymap.set("n", "<leader>ss", telescope_builtin.builtin, { desc = "[S]earch [S]elect Telescope" })
    keymap.set("n", "<leader>gf", telescope_builtin.git_files, { desc = "Search [G]it [F]iles" })
    keymap.set("n", "<leader>sf", telescope_builtin.find_files, { desc = "[S]earch [F]iles" })
    keymap.set("n", "<leader>sh", telescope_builtin.help_tags, { desc = "[S]earch [H]elp" })
    keymap.set("n", "<leader>sw", telescope_builtin.grep_string, { desc = "[S]earch current [W]ord" })
    keymap.set("n", "<leader>sg", telescope_builtin.live_grep, { desc = "[S]earch by [G]rep" })
    keymap.set("n", "<leader>sG", ":LiveGrepGitRoot<cr>", { desc = "[S]earch by [G]rep on Git Root" })
    keymap.set("n", "<leader>sd", telescope_builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
    keymap.set("n", "<leader>sr", telescope_builtin.resume, { desc = "[S]earch [R]esume" })
    keymap.set("n", "<leader>?", telescope_builtin.oldfiles, { desc = "[?] Find recently opened files" })
    keymap.set("n", "<leader><space>", telescope_builtin.buffers, { desc = "[ ] Find existing buffers" })
    keymap.set("n", "<leader>/", function()
      telescope_builtin.current_buffer_fuzzy_find(telescope_themes.get_dropdown({
        winblend = 10,
        previewer = false,
      }))
    end, { desc = "[/] Fuzzily search in current buffer" })
  end,
}
