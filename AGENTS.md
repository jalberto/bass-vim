# AGENTS.md - Neovim Configuration Repository Guidelines

This document provides specialized guidelines for agentic systems operating within this Neovim configuration repository (primarily Lua and Vimscript). Adherence to these standards is mandatory.

## 1. Development Environment & Tooling

### Dev Environment Tips
- ALWAYS prefer the "@tldr" (tldr-mcp_*) tools for code search, structure analysis, and inspection.
- ONLY use the "Grep" tool as a fallback if "tldr-mcp_search" fails to find a specific literal string or if you are searching non-code files (e.g., `.md`, `.json`, `.vim`).
- Use "tldr-mcp_tree" to understand the project structure before using "Glob".
- For file system operations, remember the project root is `/var/home/ja/.config/nvim`.

## 2. Build, Lint, and Test Commands

### General Commands
| Command Type | Language | Action | Command | Notes |
| :--- | :--- | :--- | :--- | :--- |
| **Lint Check** | Lua | Check code style and common issues | `stylua --check .` | Ensures all Lua files conform to style. |
| **Lint Fix** | Lua | Automatically fix formatting issues | `stylua .` | Use before committing. |
| **Syntax Check** | Lua/Vim | Check configuration loading and syntax | `nvim --headless -u minimal_init.lua -c 'quit'` | Minimal syntax check of core configuration files. |

### Testing

This repository uses the **Plenary/Busted** test framework for Lua code, run within a headless Neovim instance. The primary method for test execution is via a Neovim invocation.

**To Run All Tests (Assumes `lua/test/` convention):**
```bash
# Execute Plenary's test runner across the designated test directory.
# If no 'lua/test/' exists, this command is the most idiomatic Plenary command.
nvim --headless -c "PlenaryBustedDirectory lua/test/ {minimal_init=false}" -c 'qa'
```

**To Run a Single Test File:**
```bash
# Example: running a test file at lua/test/my_plugin_spec.lua
nvim --headless -c "PlenaryBustedFile lua/test/my_plugin_spec.lua {minimal_init=false}" -c 'qa'
```

**To Run a Single Test Case (using a filter):**
```bash
# Use a pattern filter to target a specific 'it()' or 'describe()' block.
# NOTE: The 'pattern' is a Lua pattern that filters test descriptions.
nvim --headless -c "PlenaryBustedDirectory lua/test/ {minimal_init=false, filter='my_test_name_pattern'}" -c 'qa'
```

### Build Process
- No dedicated build step is required for this Neovim configuration. Changes to Lua files are typically picked up immediately by Neovim upon restart or sourcing.

## 3. Code Style Guidelines (Lua & Vimscript)

### A. General Principles
- **Idempotency:** Configuration should be idempotent. Sourcing a file multiple times should not lead to unintended side effects.
- **Convention over Configuration:** Follow standard Neovim/Lua practices unless a local convention explicitly overrides it.
- **Performance:** Write performance-conscious code, especially when using autocommands or synchronous calls.

### B. Lua Style (Primary Language)
| Guideline | Rule / Convention | Example |
| :--- | :--- | :--- |
| **Formatting** | Use **StyLua** for automatic formatting. The base configuration uses **2 spaces** for indentation. **Tabs are forbidden** (`opt.expandtab = true` and `opt.shiftwidth = 2` are confirmed settings). | `local function my_func(arg)`<br>`  return arg + 1`<br>`end` |
| **Naming** | **Functions & Variables:** Use `snake_case`. | `local buffer_number = vim.fn.bufnr()` |
| **Local Variables** | Prefer `local` for all variables unless they explicitly need to be global (e.g., `vim.g.*` variables). | `local M = {}` |
| **Module System** | Use standard Lua modules (`require`) for all plugin configuration and utility files. Ensure all modules return a table/object. | `return { ... }` in `lua/plugins/*.lua` |
| **Imports** | Place all `require` statements at the top of the file. Use the pattern `local plugin_name = require('plugin.path')` | `local cmp = require('cmp')` |
| **Typing** | Use **LuaLS** type annotations (`---@param`, `---@return`, `---@type`) for all public functions and complex types to improve static analysis and editor hints. | `---@param buffer number` |
| **Error Handling** | Use `pcall` or `xpcall` when interacting with external Neovim APIs or plugins where failure is expected. Do not let configuration errors crash the editor. | `local ok, client = pcall(vim.lsp.get_active_clients)` |
| **Line Length** | Maintain a soft limit of 100 characters per line. | |

### C. Vimscript Style (Secondary Language)
- **Modern Syntax:** Prefer `vim.cmd()` in Lua for new commands instead of writing new Vimscript files, unless working within an existing `.vim` file or a filetype-specific plugin (`after/ftplugin/`).
- **Indentation:** Use 2 spaces for indentation in Vimscript files (`opt.shiftwidth=2` applies globally).
- **Legacy Commands:** Avoid using old-style commands (`let g:myvar`) when the modern `vim.g.myvar` is available in Lua.

## 4. Architectural Notes

- **Entry Point:** The configuration loads from `init.lua`.
- **Plugin Management:** Uses `lazy.nvim` (configured in `lua/plugins.lua`). All plugin-specific configuration resides within the `lua/plugins/` directory.
- **Autocommands:** Global autocommands are registered in `lua/autocommands.lua`.
- **Options:** Core `vim.opt` settings are configured in `lua/options.lua`.

## 5. Agent-Specific Rules and Exceptions

- **Existing Rules:** The following rules from the previous AGENTS.md must still be strictly followed:
    - ALWAYS prefer the "@tldr" (tldr-mcp_*) tools for code search, structure analysis, and inspection.
    - ONLY use the "Grep" tool as a fallback if "tldr-mcp_search" fails to find a specific literal string or if you are searching non-code files.
    - Use "tldr-mcp_tree" to understand project structure before using "Glob".

- **Configuration Changes:** Do not remove or substantially change existing user-specific settings (e.g., in `lua/options.lua` or `lua/keys.lua`) unless explicitly requested.
- **No Cursor or Copilot Rules Found:** No explicit agent instruction files (e.g., `.cursorrules`, `.github/copilot-instructions.md`) were found in this repository. All agent decisions must adhere to the rules in this `AGENTS.md` and the existing code conventions.