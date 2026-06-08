return {
  {
    'EdenEast/nightfox.nvim',
    config = function()
      local apple_interface_style = vim.fn.system 'defaults read -g AppleInterfaceStyle'
      if string.find(apple_interface_style, 'Dark', 1, true) then
        vim.cmd 'colorscheme carbonfox'
      else
        vim.cmd 'colorscheme dayfox'
      end
    end,
  },
  -- {
  --   'folke/tokyonight.nvim',
  --   priority = 1000,
  --   init = function()
  --     vim.cmd.colorscheme 'tokyonight-night'
  --
  --     -- You can configure highlights by doing something like:
  --     vim.cmd.hi 'Comment gui=none'
  --   end,
  -- },
}
