require('lint').linters_by_ft = {
  python = {"flake8",}
}

vim.cmd("au BufWritePost * lua require('lint').try_lint()")
vim.cmd("au BufEnter * lua require('lint').try_lint()")
