local NODE_BIN = os.getenv("ASDF_DATA_DIR") .. "/installs/nodejs/22.16.0/bin/node"

return {
  "zbirenbaum/copilot.lua",
  opts = {
    copilot_node_command = NODE_BIN,
  },
}
