return {
  -- Set up Pint & php-cs-fixer
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        php = { "php_cs_fixer", "pint", stop_after_first = true }
      },
      formatters = {
        php_cs_fixer = {
          cwd = require("conform.util").root_file({ ".use-cs-fixer" }),
          require_cwd = true
        },
      }
    }
  },

  -- Remove phpcs linter
  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = {
      linters_by_ft = {
        php = {},
      },
    },
  },

  -- Set up testing with pest and PHPUnit
  {
    "nvim-neotest/neotest",
    dependencies = {
      "V13Axel/neotest-pest",
      "olimorris/neotest-phpunit"
    },
    opts = {
      adapters = {
        ["neotest-pest"] = {
          filter_dirs = { "vendor" }
        },
        ["neotest-phpunit"] = {
          root_ignore_files = { "tests/Pest.php" },
          filter_dirs = { "vendor" }
        },
      }
    }
  },

  -- Set up Blade syntax
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "blade",
        "php_only",
      })
    end,
    config = function(_, opts)
      vim.filetype.add({
        pattern = {
          [".*%.blade%.php"] = "blade",
        },
      })

      require("nvim-treesitter.configs").setup(opts)

      local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

      parser_config.blade = {
        install_info = {
          url = "https://github.com/EmranMR/tree-sitter-blade",
          files = { "src/parser.c" },
          branch = "main",
        },
        filetype = "blade",
      }
    end
  },

  -- Go-to-file with Blade components
  {
    'ricardoramirezr/blade-nav.nvim',
    dependencies = {
      'hrsh7th/nvim-cmp',   -- if using nvim-cmp
    },
    ft = { 'blade', 'php' } -- optional, improves startup time
  }
}
