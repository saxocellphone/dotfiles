local nvim_lsp = require("lspconfig")
local globals = require("globals")
local format_async = function(err, _, result, _, bufnr)
  if err ~= nil or result == nil then return end
  if not vim.api.nvim_buf_get_option(bufnr, "modified") then
    local view = vim.fn.winsaveview()
    vim.lsp.util.apply_text_edits(result, bufnr)
    vim.fn.winrestview(view)
    if bufnr == vim.api.nvim_get_current_buf() then
      vim.api.nvim_command("noautocmd :update")
    end
  end
end

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
		underline = true,
		signs=true,
    update_in_insert = false,
    severity_sort = { reverse = true }
  }
)

vim.lsp.handlers["textDocument/formatting"] = format_async
--_G.lsp_organize_imports = function()
  --local params = {
    --command = "_typescript.organizeImports",
    --arguments = {vim.api.nvim_buf_get_name(0)},
    --title = ""
  --}
  --vim.lsp.buf.execute_command(params)
--end

local on_attach = function(client, bufnr)
  local buf_map = vim.api.nvim_buf_set_keymap
  vim.cmd("command! LspDef lua vim.lsp.buf.definition()")
  vim.cmd("command! LspFormatting lua vim.lsp.buf.formatting()")
  vim.cmd("command! LspCodeAction lua vim.lsp.buf.code_action()")
  vim.cmd("command! LspHover lua vim.lsp.buf.hover()")
  vim.cmd("command! LspRename lua vim.lsp.buf.rename()")
  --vim.cmd("command! LspOrganize lua lsp_organize_imports()")
  vim.cmd("command! LspRefs lua vim.lsp.buf.references()")
  vim.cmd("command! LspTypeDef lua vim.lsp.buf.type_definition()")
  vim.cmd("command! LspImplementation lua vim.lsp.buf.implementation()")
  vim.cmd("command! LspDiagPrev lua vim.lsp.diagnostic.goto_prev()")
  vim.cmd("command! LspDiagNext lua vim.lsp.diagnostic.goto_next()")
  vim.cmd("command! LspDiagLine lua vim.lsp.diagnostic.show_line_diagnostics()")
  vim.cmd("command! LspSignatureHelp lua vim.lsp.buf.signature_help()")
  buf_map(bufnr, "n", "gd", ":LspDef<CR>", {silent = true})
  buf_map(bufnr, "n", "go", ":LspOrganize<CR>", {silent = true})
  buf_map(bufnr, "n", "K", ":LspHover<CR>", {silent = true})
  buf_map(bufnr, "n", "H", ":LspDiagLine<CR>", {silent = true})
  buf_map(bufnr, "n", "[g", ":LspDiagPrev<CR>", {silent = true})
  buf_map(bufnr, "n", "]g", ":LspDiagNext<CR>", {silent = true})
  -- Handled by LSPSaga
  --buf_map(bufnr, "n", "gr", ":LspRename<CR>", {silent = true})
  --buf_map(bufnr, "n", "gi", ":LspImplementation<CR>", {silent = true})
  --buf_map(bufnr, "n", "ga", ":LspCodeAction<CR>", {silent = true})
  --buf_map(bufnr, "n", "gf", ":LspRefs<CR>", {silent = true})
  --if client.resolved_capabilities.document_formatting then
  --  vim.api.nvim_exec([[
  --    augroup LspAutocommands
  --        autocmd! * <buffer>
  --        autocmd BufWritePost <buffer> :lua vim.lsp.buf.formatting_sync()
  --    augroup END
  --    ]], true)
  --end
end

local filetypes = {
  typescript = "eslint",
  typescriptreact = "eslint",
  python = "flake8",
}
local linters = {
  eslint = {
    sourceName = "eslint",
    command = "eslint_d",
    rootPatterns = {".eslintrc.js", "package.json"},
    debounce = 100,
    args = {"--stdin", "--stdin-filename", "%filepath", "--format", "json"},
    parseJson = {
      errorsRoot = "[0].messages",
      line = "line",
      column = "column",
      endLine = "endLine",
      endColumn = "endColumn",
      message = "${message} [${ruleId}]",
      security = "severity"
    },
    securities = {[2] = "error", [1] = "warning"}
  },
  flake8 = {
    sourceName = "flake8",
    command = "flake8",
    debounce = 100,
    rootPatterns = {"setup.py"},
    args = {
      "--format",
      "%(row)d:%(col)d:%(code)s:%(code)s: %(text)s",
      "%file",
    },
    formatPattern = {
      "^(\\d+):(\\d+):(\\w+):(\\w).+: (.*)$",
      {
          line = 1,
          column = 2,
          message = {"[", 3, "] ", 5},
          security = 4
      }
    },
    securities = {
      E = "error",
      W = "warning",
      F = "info",
      B = "hint",
    },
  },
}

local formatters = {
  prettier = {command = "prettier", args = {"--stdin-filepath", "%filepath"}}
}
local formatFiletypes = {
  typescript = "prettier",
  typescriptreact = "prettier",
}

-- LSP Setups
nvim_lsp.diagnosticls.setup {
  on_attach = on_attach,
  filetypes = vim.tbl_keys(filetypes),
  init_options = {
    filetypes = filetypes,
    linters = linters,
    formatters = formatters,
    formatFiletypes = formatFiletypes
  }
}

nvim_lsp.tsserver.setup {
  on_attach = function(client)
    client.resolved_capabilities.document_formatting = false
    on_attach(client)
  end
}

nvim_lsp.rust_analyzer.setup({
  on_attach = on_attach
})

nvim_lsp.pyright.setup({
  on_attach = on_attach
})

nvim_lsp.ccls.setup {
  on_attach = on_attach
}
-- Below are for Lua lsp
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

nvim_lsp.sumneko_lua.setup {
		cmd = {"lua-language-server"},
    on_attach = on_attach,
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
                -- Setup your lua path
                path = vim.split(package.path, ';')
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {'vim'}
            },
            workspace = {
								library = vim.api.nvim_get_runtime_file("", true),
            },
						telemetry = {
							enable = false,
						}
        }
    }
}
