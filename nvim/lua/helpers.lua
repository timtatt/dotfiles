local M = {}

M.get_git_root = function()
  local eval_path = vim.fn.resolve(vim.fn.expand '%:p')
  local git_root = Snacks.git.get_root(eval_path)
  return git_root
end

return M
