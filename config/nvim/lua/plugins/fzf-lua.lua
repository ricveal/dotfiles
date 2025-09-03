return {
  "ibhagwan/fzf-lua",
  opts = function(_, opts)
    local fzf = require("fzf-lua")
    local actions = fzf.actions
    opts.files = {
      actions = {
        ["alt-i"] = { actions.toggle_ignore },
        ["alt-o"] = { actions.toggle_hidden },
      },
    }
    opts.grep = {
      actions = {
        ["alt-i"] = { actions.toggle_ignore },
        ["alt-o"] = { actions.toggle_hidden },
      },
    }
    return opts
  end,
}
