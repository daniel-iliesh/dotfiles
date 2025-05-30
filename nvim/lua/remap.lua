vim.g.loaded_netrw       = 1
vim.g.loaded_netrwPlugin = 1

vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", function() require("nvim-tree.api").tree.toggle() end)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "=ap", "ma=ap'a")
vim.keymap.set("n", "<leader>zig", "<cmd>LspRestart<cr>")

vim.keymap.set("n", "<leader>vwm", function()
    require("vim-with-me").StartVimWithMe()
end)
vim.keymap.set("n", "<leader>svwm", function()
    require("vim-with-me").StopVimWithMe()
end)

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({"n", "v"}, "<leader>d", "\"_d")

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set(
    "n",
    "<leader>ee",
    "oif err != nil {<CR>}<Esc>Oreturn err<Esc>"
)

vim.keymap.set(
    "n",
    "<leader>ea",
    "oassert.NoError(err, \"\")<Esc>F\";a"
)

vim.keymap.set(
    "n",
    "<leader>ef",
    "oif err != nil {<CR>}<Esc>Olog.Fatalf(\"error: %s\\n\", err.Error())<Esc>jj"
)

vim.keymap.set(
    "n",
    "<leader>el",
    "oif err != nil {<CR>}<Esc>O.logger.Error(\"error\", \"error\", err)<Esc>F.;i"
)

vim.keymap.set("n", "<leader>ca", function()
    require("cellular-automaton").start_animation("make_it_rain")
end)

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)

local term_win = nil
local term_buf = nil

vim.keymap.set('n', '<C-`>', function()
  if term_win and vim.api.nvim_win_is_valid(term_win) then
    -- Hide the terminal window (preserve buffer and process)
    vim.api.nvim_win_close(term_win, true)
    term_win = nil
  else
    local height = math.floor(vim.o.lines / 3)

    if term_buf and vim.api.nvim_buf_is_valid(term_buf) then
      -- Reopen existing terminal buffer
      vim.cmd('botright split')
      term_win = vim.api.nvim_get_current_win()
      vim.api.nvim_win_set_buf(term_win, term_buf)
    else
      -- Create a new terminal buffer
      vim.cmd('botright split')
      term_win = vim.api.nvim_get_current_win()
      term_buf = vim.api.nvim_create_buf(false, true)
      vim.api.nvim_win_set_buf(term_win, term_buf)
      vim.fn.termopen(os.getenv("SHELL"))
    end

    -- Resize to 1/3 of the screen
    vim.api.nvim_win_set_height(term_win, height)

    -- Enter insert mode
    -- vim.cmd('startinsert')
  end
end, { noremap = true, silent = true })

