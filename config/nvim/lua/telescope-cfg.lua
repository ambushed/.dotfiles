require("telescope").setup{
    defaults = {
        file_ignore_patterns = { "^\\.git/", "^build/", "^target/","^cmake-" },
        vimgrep_arguments = {
          'rg',
          '--color=never',
          '--no-heading',
          '--with-filename',
          '--line-number',
          '--column',
          '--smart-case',
          '--no-ignore' -- in addition to the defaults above
        }
    },
    extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_dropdown { -- even more opts
      }
    }
  }
}

require("telescope").load_extension("ui-select")
require('telescope').load_extension('cmake4vim')
