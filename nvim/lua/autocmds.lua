-- Autocmds: keep all autocmds here

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "trouble" },
  callback = function()
    vim.o.relativenumber = true
    vim.o.wrap = true
  end,
})
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "netrw" },
  callback = function()
    vim.o.relativenumber = true
  end,
})
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "html", "css", "json", "typescript*", "javascript*", "lua", "markdown" },
  callback = function()
    vim.bo.tabstop = 2
    vim.bo.shiftwidth = 2
    vim.bo.expandtab = true
  end,
})
vim.api.nvim_create_autocmd("FileType", {
  pattern =  "help",
  callback = function()
    vim.o.number = false
    vim.o.relativenumber = false
  end,
})
vim.api.nvim_create_autocmd("FileType", {
  pattern =  "NvimTree",
  callback = function()
    vim.o.relativenumber = true
  end,
})
