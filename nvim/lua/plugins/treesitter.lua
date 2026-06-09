return {
  {
    'romus204/tree-sitter-manager.nvim',
    dependencies = {},
    config = function()
      require('tree-sitter-manager').setup {
        ensure_installed = {
          'bash',
          'c',
          'diff',
          'html',
          'javascript',
          'jsdoc',
          'json',
          'lua',
          'go',
          'luadoc',
          'luap',
          'markdown',
          'markdown_inline',
          'printf',
          'python',
          'query',
          'regex',
          'toml',
          'tsx',
          'typescript',
          'vim',
          'vimdoc',
          'xml',
          'yaml',
        },
        auto_install = true,
      }

      vim.treesitter.language.register('terraform', { 'terraform', 'terraform-vars' })
    end,
  },
}
