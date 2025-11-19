local NODE_BIN = os.getenv("HOME") .. "/.local/share/mise/installs/node/24.11.1/bin/node"

return {
  "zbirenbaum/copilot.lua",
  enabled = CopilotEnabled,
  opts = {
    copilot_node_command = NODE_BIN,
  },
}
