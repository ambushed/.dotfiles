require'nvim-treesitter.configs'.setup {
    ---- One of "all", "maintained" (parsers with maintainers), or a list of languages
    ensure_installed = {"rust", "cpp", "python", "bash", "cmake", "lua", "toml"}
    ---- Install languages synchronously (only applied to `ensure_installed`)
    -- sync_install = false,
    -- indent = {enable = true},
    -- matchup = {enable = true},
    -- autopairs = {enable = true},
    -- highlight = {
    --    -- `false` will disable the whole extension
    --    disable = false,
    --    -- list of language that will be disabled
    --    enable = {"rust", "cpp", "python", "bash", "cmake"}
    --    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    --    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    --    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    --    -- Instead of true it can also be a list of languages
    --    -- additional_vim_regex_highlighting = false,
    -- },
    -- incremental_selection = {
    --    enable = true,
    --    keymaps = {
    --        init_selection = "<CR>",
    --        scope_incremental = "<CR>",
    --        node_incremental = "<TAB>",
    --        node_decremental = "<S-TAB>"
    --    }
    -- }
}
