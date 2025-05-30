local function goimports()
  local context = {
    source = {
      organizeImports = true,
    },
  }
  vim.validate(
    {
      context = {
        context,
        "t",
        true,
      },
    }
  )
  local params = vim.lsp.util.make_range_params()
  params.context = context

  -- See the implementation of the textDocument/codeAction callback
  -- (lua/vim/lsp/handler.lua) for how to do this properly.
  local timeout_ms = 3000
  local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, timeout_ms)
  if not result or next(result) == nil then
    return
  end
  local actions = result[1].result
  if not actions then
    return
  end
  local action = actions[1]

  -- textDocument/codeAction can return either Command[] or CodeAction[]. If it
  -- is a CodeAction, it can have either an edit, a command or both. Edits
  -- should be executed first.
  if action.edit or type(action.command) == "table" then
    if action.edit then
      vim.lsp.util.apply_workspace_edit(action.edit, "utf-8")
    end
    if type(action.command) == "table" then
      vim.lsp.buf.execute_command(action.command)
    end
  else
    vim.lsp.buf.execute_command(action)
  end
end

-- Format code before save
vim.api.nvim_create_autocmd(
  "BufWritePre", {
    pattern = "*.go",
    callback = function()
      goimports()
      return vim.lsp.buf.format({ async = true, })
    end,
  }
)
