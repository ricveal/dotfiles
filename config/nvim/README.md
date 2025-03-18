# 💤 LazyVim

My configuration for [LazyVim](https://github.com/LazyVim/LazyVim).
Refer to the [documentation](https://lazyvim.github.io/installation) to get started.

## Conditional loading

I'm using conditional loading for some plugins depending on the path.
You can create `lua/config/work.lua` file to overwrite some of these variables used to conditionally load the plugins.

```lua
NotesConfig = vim.uv.cwd():match("notes") ~= nil
```
