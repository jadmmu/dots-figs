-- mahito.nvim — soft menace theme

vim.cmd("hi clear")
vim.o.background = "dark"
vim.g.colors_name = "mahito"

local c = {
  bg       = "#0f1923",
  bg_alt  = "#131f2d",
  fg       = "#cdd6f4",
  fg_dim   = "#9aa5ce",

  blue     = "#7aa2f7", -- Mahito accent
  cyan     = "#89ddff",
  purple   = "#bb9af7",
  red      = "#f7768e",
  green    = "#9ece6a",
  yellow   = "#e0af68",

  border   = "#2a3441",
}

local set = vim.api.nvim_set_hl

-- Editor
set(0, "Normal",        { fg = c.fg, bg = c.bg })
set(0, "NormalFloat",   { fg = c.fg, bg = c.bg_alt })
set(0, "LineNr",        { fg = c.fg_dim })
set(0, "CursorLineNr",  { fg = c.blue, bold = true })
set(0, "CursorLine",    { bg = "#182433" })
set(0, "VertSplit",     { fg = c.border })
set(0, "Visual",        { bg = "#243447" })

-- UI
set(0, "StatusLine",    { fg = c.fg, bg = c.bg_alt })
set(0, "StatusLineNC",  { fg = c.fg_dim, bg = c.bg_alt })
set(0, "Pmenu",         { fg = c.fg, bg = c.bg_alt })
set(0, "PmenuSel",      { fg = c.bg, bg = c.blue })
set(0, "FloatBorder",   { fg = c.blue })

-- Syntax (no Treesitter needed)
set(0, "Comment",       { fg = c.fg_dim, italic = true })
set(0, "Keyword",       { fg = c.blue })
set(0, "Function",      { fg = c.cyan })
set(0, "String",        { fg = c.green })
set(0, "Number",        { fg = c.purple })
set(0, "Boolean",       { fg = c.purple })
set(0, "Type",          { fg = c.yellow })
set(0, "Identifier",    { fg = c.fg })
set(0, "Constant",      { fg = c.red })

-- Diagnostics
set(0, "DiagnosticError", { fg = c.red })
set(0, "DiagnosticWarn",  { fg = c.yellow })
set(0, "DiagnosticInfo",  { fg = c.blue })
set(0, "DiagnosticHint",  { fg = c.cyan })
