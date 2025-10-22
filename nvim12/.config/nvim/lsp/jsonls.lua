local schemas = {
  {
    name = "default.project.json",
    description = "JSON schema for Rojo project files",
    fileMatch = { "*.project.json" },
    url = "https://raw.githubusercontent.com/rojo-rbx/vscode-rojo/master/schemas/project.template.schema.json",
  },
}

vim.lsp.config("jsonls", {
  settings = {
    json = {
      -- without SchemaStore.nvim
      schemas = schemas,

      -- or if using SchemaStore.nvim
      -- schemas = require("schemastore").json.schemas { extra = schemas },

      validate = {
        enabled = true
      },
    },
  },
})
