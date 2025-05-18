return {
    'echasnovski/mini.nvim',
    version = false,
    config = function()
        require('mini.ai').setup()
        require('mini.align').setup()
        require('mini.move').setup()
        require('mini.splitjoin').setup()
        require('mini.jump').setup{delay = { highlight = 0 }}
        vim.keymap.set('n', '<Esc>', function() require('mini.jump').stop_jumping() end, { silent = true })
    end
}
