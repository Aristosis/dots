return {
    "stevearc/conform.nvim",
    config = function()
        require("conform").setup {
            formatters_by_ft = {
                lua = { "stylua" },
                luau = { "stylua" }
            },
            format_on_save = function(bufnr)
                local ignore_filetypes = {}
                if vim.tbl_contains(ignore_filetypes, vim.bo[bufnr].filetype) then return end
                if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then return end

                local bufname = vim.api.nvim_buf_get_name(bufnr)
                if bufname:match("/Packages/") then return end

                return { timeout_ms = 500, lsp_format = "fallback" }
            end
        }

        vim.api.nvim_create_user_command("Format", function(args)
            local range = nil
            if args.count ~= -1 then
                local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
                range = {
                    start = { args.line1, 0 },
                    ["end"] = { args.line2, end_line:len() },
                }
            end
            require("conform").format({ async = true, lsp_format = "fallback", range = range })
        end, { range = true })

        vim.api.nvim_create_user_command("FormatToggle", function(args)
            if args.bang then
                vim.b.disable_autoformat = false
                vim.g.disable_autoformat = false
                print("Autoformat enabled (forced)")
            else
                local new_state = not (vim.b.disable_autoformat or vim.g.disable_autoformat)
                vim.b.disable_autoformat = new_state
                vim.g.disable_autoformat = new_state
                print("Autoformat " .. (new_state and "disabled" or "enabled"))
            end
        end, {
            desc = "Toggle autoformat-on-save (use ! to force enable)",
            bang = true,
        })
    end
}
