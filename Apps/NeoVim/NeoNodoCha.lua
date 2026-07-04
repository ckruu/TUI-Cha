-- ~/.config/nvim/lua/plugins/tokyonight_custom.lua
-- Full green-tinted theme — 100% transparent background so your terminal
-- wallpaper/bg shows through. Only CursorLine, selections, and statusline
-- have a tinted bg for readability. Errors/warnings stay semantic.

return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "night",
      transparent = true,         -- key: lets terminal bg show through
      terminal_colors = true,
      styles = {
        comments    = { italic = true },
        keywords    = { italic = true },
        functions   = {},
        variables   = {},
        sidebars    = "transparent",
        floats      = "transparent",
      },

      on_colors = function(c)
        -- ── Foregrounds (green-tinted) ────────────────────────────────────────
        c.fg         = "#e4f5e1"   -- near-white, green-tinted
        c.fg_dark    = "#a8c5a0"   -- mid green-grey
        c.fg_gutter  = "#4d6b55"   -- dim gutter green
        c.fg_sidebar = "#8aab84"   -- sidebar text
        c.comment    = "#4d7a57"   -- muted green comment

        -- ── Primary accent ───────────────────────────────────────────────────
        c.green      = "#A6E3A1"
        c.green1     = "#A6E3A1"
        c.green2     = "#7dd4a8"

        -- ── Secondary palette (green-shifted) ────────────────────────────────
        c.teal       = "#89d4b8"
        c.cyan       = "#7ecfc0"
        c.blue       = "#7ab8a0"
        c.blue1      = "#6abfa8"
        c.blue2      = "#7ecfc0"
        c.blue5      = "#8ecfa8"
        c.blue6      = "#7ecfc0"
        c.blue7      = "#7ab8a0"

        -- ── Purples (keyword contrast) ────────────────────────────────────────
        c.purple     = "#b8a4e0"
        c.magenta    = "#b8a4e0"
        c.magenta2   = "#d4a8c0"

        -- ── Semantic colors (untouched) ───────────────────────────────────────
        c.red        = "#f38ba8"
        c.red1       = "#eba0ac"
        c.orange     = "#fab387"
        c.yellow     = "#f9e2af"

        -- ── Borders ──────────────────────────────────────────────────────────
        c.border           = "#2d5c3a"
        c.border_highlight = "#A6E3A1"

        -- ── Git ──────────────────────────────────────────────────────────────
        c.git = { add = "#A6E3A1", change = "#f9e2af", delete = "#f38ba8" }

        -- ── Diagnostics ──────────────────────────────────────────────────────
        c.error   = "#f38ba8"
        c.warning = "#f9e2af"
        c.info    = "#89d4b8"
        c.hint    = "#A6E3A1"

        -- ── Diff ─────────────────────────────────────────────────────────────
        c.diff = {
          add    = "#1a2e1e",
          delete = "#2d1e1e",
          change = "#2d2a1e",
          text   = "#A6E3A1",
        }

        -- bg values still needed by lualine/statusline (not used for editor bg)
        c.bg            = "#181F1C"
        c.bg_dark       = "#131a16"
        c.bg_darker     = "#0d110f"
        c.bg_float      = "#181F1C"
        c.bg_popup      = "#181F1C"
        c.bg_sidebar    = "#131a16"
        c.bg_statusline = "#0f1a12"
        c.bg_highlight  = "#1e3028"
        c.bg_visual     = "#1e3028"
        c.bg_search     = "#1e3028"
      end,

      on_highlights = function(hl, c)
        -- ── Editor (no bg on Normal = transparent) ───────────────────────────
        hl.Normal         = { fg = c.fg }
        hl.NormalFloat    = { fg = c.fg }
        hl.NormalNC       = { fg = c.fg_dark }
        hl.SignColumn     = { fg = c.fg_gutter }
        hl.LineNr         = { fg = c.fg_gutter }
        hl.CursorLineNr   = { fg = c.green, bold = true }
        hl.CursorLine     = { bg = "#1e3028" }   -- visible but subtle
        hl.ColorColumn    = { bg = "#1a2a1e" }
        hl.CursorColumn   = { bg = "#1a2a1e" }
        hl.VertSplit      = { fg = c.border }
        hl.WinSeparator   = { fg = c.border }
        hl.FloatBorder    = { fg = c.border_highlight }
        hl.EndOfBuffer    = { fg = c.fg_gutter }
        hl.NonText        = { fg = c.fg_gutter }
        hl.Whitespace     = { fg = "#2d4a35" }
        hl.SpecialKey     = { fg = "#3a5c42" }
        hl.MsgArea        = { fg = c.fg_dark }
        hl.ModeMsg        = { fg = c.green, bold = true }
        hl.ErrorMsg       = { fg = c.red }
        hl.WarningMsg     = { fg = c.yellow }

        -- ── Selections & search ──────────────────────────────────────────────
        hl.Visual         = { bg = "#1e3828" }
        hl.VisualNOS      = { bg = "#1e3828" }
        hl.Search         = { fg = "#0d110f", bg = c.green }
        hl.IncSearch      = { fg = "#0d110f", bg = c.orange }
        hl.CurSearch      = { fg = "#0d110f", bg = c.green }

        -- ── Syntax ───────────────────────────────────────────────────────────
        hl.Comment        = { fg = c.comment, italic = true }
        hl.Keyword        = { fg = c.purple, italic = true }
        hl.Statement      = { fg = c.purple }
        hl.Conditional    = { fg = c.purple }
        hl.Repeat         = { fg = c.purple }
        hl.Exception      = { fg = c.purple }
        hl.Function       = { fg = c.green }
        hl["@function"]             = { fg = c.green }
        hl["@function.call"]        = { fg = c.green }
        hl["@function.builtin"]     = { fg = c.teal }
        hl["@method"]               = { fg = c.green }
        hl["@method.call"]          = { fg = c.green }
        hl.Identifier               = { fg = c.fg }
        hl["@variable"]             = { fg = c.fg }
        hl["@variable.builtin"]     = { fg = c.red }
        hl["@parameter"]            = { fg = "#c8e8c0" }
        hl.String                   = { fg = c.green2 }
        hl["@string"]               = { fg = c.green2 }
        hl["@string.escape"]        = { fg = c.teal }
        hl["@string.special"]       = { fg = c.teal }
        hl.Number                   = { fg = c.orange }
        hl.Boolean                  = { fg = c.orange }
        hl.Float                    = { fg = c.orange }
        hl.Type                     = { fg = c.teal }
        hl["@type"]                 = { fg = c.teal }
        hl["@type.builtin"]         = { fg = c.blue1 }
        hl.Constant                 = { fg = c.green1 }
        hl["@constant"]             = { fg = c.green1 }
        hl["@constant.builtin"]     = { fg = c.orange }
        hl.Operator                 = { fg = "#7ecfc0" }
        hl.Delimiter                = { fg = c.fg_dark }
        hl.SpecialChar              = { fg = c.red }
        hl.Tag                      = { fg = c.green }
        hl["@tag"]                  = { fg = c.green }
        hl["@tag.attribute"]        = { fg = c.blue5 }
        hl["@tag.delimiter"]        = { fg = c.fg_dark }
        hl.PreProc                  = { fg = c.teal }
        hl.Include                  = { fg = c.purple }
        hl.Define                   = { fg = c.purple }
        hl.Macro                    = { fg = c.purple }
        hl.Special                  = { fg = c.teal }

        -- ── Treesitter ───────────────────────────────────────────────────────
        hl["@keyword"]              = { fg = c.purple, italic = true }
        hl["@keyword.function"]     = { fg = c.purple }
        hl["@keyword.operator"]     = { fg = "#7ecfc0" }
        hl["@keyword.return"]       = { fg = c.purple, italic = true }
        hl["@namespace"]            = { fg = c.blue5 }
        hl["@property"]             = { fg = c.teal }
        hl["@field"]                = { fg = c.teal }
        hl["@constructor"]          = { fg = c.teal }
        hl["@punctuation.bracket"]  = { fg = c.fg_dark }
        hl["@punctuation.delimiter"]= { fg = c.fg_gutter }
        hl["@punctuation.special"]  = { fg = "#7ecfc0" }

        -- ── LSP ──────────────────────────────────────────────────────────────
        hl.LspReferenceText  = { bg = "#1e3028" }
        hl.LspReferenceRead  = { bg = "#1e3028" }
        hl.LspReferenceWrite = { bg = "#2a1e1e" }

        -- ── Diagnostics ──────────────────────────────────────────────────────
        hl.DiagnosticError = { fg = c.error }
        hl.DiagnosticWarn  = { fg = c.warning }
        hl.DiagnosticInfo  = { fg = c.info }
        hl.DiagnosticHint  = { fg = c.hint }
        hl.DiagnosticVirtualTextError = { fg = c.error }
        hl.DiagnosticVirtualTextWarn  = { fg = c.warning }
        hl.DiagnosticVirtualTextInfo  = { fg = c.info }
        hl.DiagnosticVirtualTextHint  = { fg = c.hint }
        hl.DiagnosticUnderlineError = { undercurl = true, sp = c.error }
        hl.DiagnosticUnderlineWarn  = { undercurl = true, sp = c.warning }
        hl.DiagnosticUnderlineInfo  = { undercurl = true, sp = c.info }
        hl.DiagnosticUnderlineHint  = { undercurl = true, sp = c.hint }

        -- ── Telescope (transparent panes) ─────────────────────────────────────
        hl.TelescopeBorder        = { fg = c.border_highlight }
        hl.TelescopeNormal        = { fg = c.fg }
        hl.TelescopePromptBorder  = { fg = c.green }
        hl.TelescopePromptNormal  = { fg = c.fg }
        hl.TelescopeResultsBorder = { fg = c.border }
        hl.TelescopeSelection     = { fg = c.fg, bg = "#1e3828" }
        hl.TelescopeSelectionCaret= { fg = c.green }
        hl.TelescopeMatching      = { fg = c.green, bold = true }

        -- ── nvim-cmp ─────────────────────────────────────────────────────────
        hl.CmpItemAbbr           = { fg = c.fg_dark }
        hl.CmpItemAbbrMatch      = { fg = c.green, bold = true }
        hl.CmpItemAbbrMatchFuzzy = { fg = c.green }
        hl.CmpItemKindFunction   = { fg = c.green }
        hl.CmpItemKindMethod     = { fg = c.green }
        hl.CmpItemKindKeyword    = { fg = c.purple }
        hl.CmpItemKindVariable   = { fg = c.fg }
        hl.CmpItemKindField      = { fg = c.teal }
        hl.CmpItemKindProperty   = { fg = c.teal }
        hl.CmpItemKindClass      = { fg = c.teal }
        hl.CmpItemKindModule     = { fg = c.blue5 }
        hl.CmpItemKindSnippet    = { fg = c.orange }
        hl.CmpItemMenu           = { fg = c.comment }
        hl.Pmenu      = { fg = c.fg_dark }
        hl.PmenuSel   = { fg = c.fg, bg = "#1e3028" }
        hl.PmenuThumb = { bg = c.green }

        -- ── Git signs ────────────────────────────────────────────────────────
        hl.GitSignsAdd    = { fg = c.green }
        hl.GitSignsChange = { fg = c.yellow }
        hl.GitSignsDelete = { fg = c.red }

        -- ── Indent blankline ─────────────────────────────────────────────────
        hl.IndentBlanklineChar        = { fg = "#2d4a35" }
        hl.IndentBlanklineContextChar = { fg = c.green }
        hl.IblIndent = { fg = "#2d4a35" }
        hl.IblScope  = { fg = "#4d7a57" }

        -- ── Statusline ───────────────────────────────────────────────────────
        -- c = middle section transparent; a/b/y/z keep opaque pills
        hl.StatusLine   = { fg = c.fg_dark }   -- transparent base
        hl.StatusLineNC = { fg = c.comment }

        -- ── Lualine ──────────────────────────────────────────────────────────
        -- NORMAL — green pills, transparent middle
        hl.lualine_a_normal  = { fg = "#0d110f", bg = c.green,  bold = true }
        hl.lualine_b_normal  = { fg = c.green,   bg = "#1a2e1e" }
        hl.lualine_c_normal  = { fg = c.fg_dark }                         -- transparent
        hl.lualine_x_normal  = { fg = c.comment }                         -- transparent
        hl.lualine_y_normal  = { fg = c.green,   bg = "#1a2e1e" }
        hl.lualine_z_normal  = { fg = "#0d110f", bg = c.green,  bold = true }
        -- INSERT — teal pills
        hl.lualine_a_insert  = { fg = "#0d110f", bg = c.teal,   bold = true }
        hl.lualine_b_insert  = { fg = c.teal,    bg = "#1a2e1e" }
        hl.lualine_c_insert  = { fg = c.fg_dark }
        hl.lualine_x_insert  = { fg = c.comment }
        hl.lualine_y_insert  = { fg = c.teal,    bg = "#1a2e1e" }
        hl.lualine_z_insert  = { fg = "#0d110f", bg = c.teal,   bold = true }
        -- VISUAL — lavender/soft purple pills
        hl.lualine_a_visual  = { fg = "#0d110f", bg = "#b4befe", bold = true }
        hl.lualine_b_visual  = { fg = "#b4befe", bg = "#1e1a2e" }
        hl.lualine_c_visual  = { fg = c.fg_dark }
        hl.lualine_x_visual  = { fg = c.comment }
        hl.lualine_y_visual  = { fg = "#b4befe", bg = "#1e1a2e" }
        hl.lualine_z_visual  = { fg = "#0d110f", bg = "#b4befe", bold = true }
        -- V-BLOCK / V-LINE — slightly brighter mauve to distinguish
        hl.lualine_a_v_block = { fg = "#0d110f", bg = "#cba6f7", bold = true }
        hl.lualine_b_v_block = { fg = "#cba6f7", bg = "#1e1a2e" }
        hl.lualine_z_v_block = { fg = "#0d110f", bg = "#cba6f7", bold = true }
        -- REPLACE — red pills
        hl.lualine_a_replace = { fg = "#0d110f", bg = c.red,    bold = true }
        hl.lualine_b_replace = { fg = c.red,     bg = "#2e1a1a" }
        hl.lualine_c_replace = { fg = c.fg_dark }
        hl.lualine_x_replace = { fg = c.comment }
        hl.lualine_y_replace = { fg = c.red,     bg = "#2e1a1a" }
        hl.lualine_z_replace = { fg = "#0d110f", bg = c.red,    bold = true }
        -- COMMAND — orange pills
        hl.lualine_a_command = { fg = "#0d110f", bg = c.orange, bold = true }
        hl.lualine_b_command = { fg = c.orange,  bg = "#2e1f1a" }
        hl.lualine_c_command = { fg = c.fg_dark }
        hl.lualine_x_command = { fg = c.comment }
        hl.lualine_y_command = { fg = c.orange,  bg = "#2e1f1a" }
        hl.lualine_z_command = { fg = "#0d110f", bg = c.orange, bold = true }
        -- INACTIVE — all transparent/dim
        hl.lualine_a_inactive = { fg = c.comment }
        hl.lualine_b_inactive = { fg = c.comment }
        hl.lualine_c_inactive = { fg = c.comment }

        -- ── Tabline ──────────────────────────────────────────────────────────
        hl.TabLine     = { fg = c.comment }
        hl.TabLineFill = {}
        hl.TabLineSel  = { fg = c.green, bold = true }

        -- ── Misc ─────────────────────────────────────────────────────────────
        hl.MatchParen = { fg = c.green, bold = true, underline = true }
        hl.Folded     = { fg = c.comment, bg = "#1a2a1e" }
        hl.FoldColumn = { fg = c.comment }
        hl.Title      = { fg = c.green, bold = true }
        hl.Directory  = { fg = c.green }
        hl.MoreMsg    = { fg = c.green }
        hl.Question   = { fg = c.green }
        hl.WildMenu   = { fg = c.fg, bg = "#1e3028" }
        hl.Conceal    = { fg = c.comment }

        -- ── Neo-tree (transparent sidebar) ───────────────────────────────────
        hl.NeoTreeNormal        = { fg = c.fg }
        hl.NeoTreeNormalNC      = { fg = c.fg_dark }
        hl.NeoTreeRootName      = { fg = c.green, bold = true }
        hl.NeoTreeDirectoryName = { fg = "#8ecfa8" }
        hl.NeoTreeDirectoryIcon = { fg = c.green }
        hl.NeoTreeFileName      = { fg = c.fg_dark }
        hl.NeoTreeFileIcon      = { fg = c.comment }
        hl.NeoTreeGitAdded      = { fg = c.green }
        hl.NeoTreeGitModified   = { fg = c.yellow }
        hl.NeoTreeGitDeleted    = { fg = c.red }
        hl.NeoTreeIndentMarker  = { fg = "#2d4a35" }
        hl.NeoTreeExpander      = { fg = c.comment }

        -- ── Notify ───────────────────────────────────────────────────────────
        hl.NotifyERRORBorder = { fg = c.error }
        hl.NotifyWARNBorder  = { fg = c.warning }
        hl.NotifyINFOBorder  = { fg = c.info }
        hl.NotifyDEBUGBorder = { fg = c.comment }
        hl.NotifyTRACEBorder = { fg = c.purple }
        hl.NotifyERRORTitle  = { fg = c.error }
        hl.NotifyWARNTitle   = { fg = c.warning }
        hl.NotifyINFOTitle   = { fg = c.info }
        hl.NotifyDEBUGTitle  = { fg = c.comment }
        hl.NotifyTRACETitle  = { fg = c.purple }

        -- ── Which-key ────────────────────────────────────────────────────────
        hl.WhichKey          = { fg = c.green }
        hl.WhichKeyGroup     = { fg = "#8ecfa8" }
        hl.WhichKeyDesc      = { fg = c.fg_dark }
        hl.WhichKeySeperator = { fg = c.comment }
        hl.WhichKeyFloat     = {}
        hl.WhichKeyBorder    = { fg = c.border }
      end,
    },
    config = function(_, opts)
      require("tokyonight").setup(opts)
      vim.cmd("colorscheme tokyonight")
    end,
  },
}
