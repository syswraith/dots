return {
  "stevearc/oil.nvim",

  opts = {
    default_file_explorer = true,

    columns = {
      "icon",
      "permissions",
      "size",
      "mtime",
    },

    delete_to_trash = false,
    skip_confirm_for_simple_edits = true,
    prompt_save_on_select_new_entry = true,

    cleanup_delay_ms = 2000,

    lsp_file_methods = {
      enabled = true,
      timeout_ms = 1000,
      autosave_changes = false,
    },

    constrain_cursor = "editable",
    watch_for_changes = true,

    view_options = {
      show_hidden = true,
      natural_order = false,
      case_insensitive = false,
    },

    preview_win = {
      update_on_cursor_moved = true,
      preview_method = "fast_scratch",
    },

    git = {
      add = function() return false end,
      mv = function() return false end,
      rm = function() return false end,
    },
  },

  dependencies = {
    { "nvim-mini/mini.icons", opts = {} },
  },

  lazy = false,
}
