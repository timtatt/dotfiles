local function pre_format_on_save(bufnr)
  if vim.tbl_contains({ 'typescriptreact', 'typescript' }, vim.bo[bufnr].filetype) then
    vim.lsp.buf.code_action {
      context = {
        only = { 'source.organizeImports' },
      },
      apply = true,
    }
  end
end
return {
  {
    'stevearc/conform.nvim',
    opts = {},
    config = function()
      local conform = require 'conform'
      conform.setup {
        formatters_by_ft = {
          lua = { 'stylua' },
          xml = { 'xmlformatter' },
          python = { 'isort', 'black' },
          javascript = { 'prettier', stop_after_first = true },
          typescript = { 'prettier' },
          typescriptreact = { 'prettier' },
          markdown = { 'prettier' },
          json = { 'prettier' },
          svg = { 'prettier' },
          go = { 'gofmt', 'goimports' },
          html = { 'prettier' },
          bash = { 'shfmt' },
        },
        format_on_save = function(bufnr)
          if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
            return
          end

          return {
            timeout_ms = 500,
            lsp_format = 'fallback',
          }
        end,
      }

      conform.formatters.shfmt = {
        prepend_args = { '-i', '2', '-sr', '-ci' },
      }

      vim.keymap.set('n', '<leader>tf', function()
        if vim.b.disable_autoformat then
          vim.cmd 'FormatEnable'
          vim.notify 'Enabled autoformat for current buffer'
        else
          vim.cmd 'FormatDisable'
          vim.notify 'Disabled autoformat for current buffer'
        end
      end, {
        desc = 'Toggle autoformat for current buffer',
      })

      vim.keymap.set('n', '<leader>tF', function()
        if vim.g.disable_autoformat then
          vim.cmd 'FormatEnable'
          vim.notify 'Enabled autoformat globally'
        else
          vim.cmd 'FormatDisable'
          vim.notify 'Disabled autoformat globally'
        end
      end, {
        desc = 'Toggle autoformat globally',
      })

      vim.keymap.set('n', '<leader>f', function()
        local bufnr = vim.api.nvim_get_current_buf()

        pre_format_on_save(bufnr)

        conform.format { bufnr = vim.api.nvim_get_current_buf() }
      end, { desc = '[F]ormat buffer' })
    end,
  },
}
