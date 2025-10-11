local c = require('onedark.colors')
local cfg = require('onedark.config')
local util = require("onedark.util")

local M = {}
local hl = {langs = {}, plugins = {}}

local function gui(group_settings)
    if group_settings.bold then return "bold"
    elseif group_settings.underline then return "underline"
    elseif group_settings.undercurl then return "undercurl"
    elseif group_settings.italic then return "italic"
    elseif group_settings.reverse then return "reverse"
    else return "NONE" end
end

local function vim_highlights(highlights)
    for group_name, group_settings in pairs(highlights) do
        local fg = group_settings.fg and "guifg=" .. group_settings.fg or "guifg=NONE"
        local bg = group_settings.bg and "guibg=" .. group_settings.bg or "guibg=NONE"
        local sp = group_settings.sp and "guisp=" .. group_settings.sp or "guisp=NONE"
        vim.cmd("highlight " .. group_name .. " ".."gui="..gui(group_settings).." "..fg .. " " .. bg .. " " .. sp)
    end
end


local colors = {
    ivory = {fg = c.ivory},
    lightGrey = {fg = c.light_grey},
    stone = {fg = c.stone},
    coral = {fg = c.coral},
    cyan = {fg = c.cyan},
    chalky = {fg = c.chalky},
    whiskey = {fg = c.whiskey},
    sage = {fg = c.sage},
    malibu = {fg = c.malibu},
    violet = {fg = c.violet}
}

hl.common = {
    Normal = {fg = c.ivory, bg = cfg.bg and c.none or c.bg0},
    Terminal = {fg = c.ivory, bg = cfg.bg and c.none or c.bg0},
    EndOfBuffer = {fg = cfg.hide_ending_tildes and c.bg0 or c.bg2, bg = cfg.bg and c.none or c.bg0},
    FoldColumn = {fg = c.ivory, bg = cfg.bg and c.none or c.bg1},
    Folded = {fg = c.ivory, bg = cfg.bg and c.none or c.bg1},
    SignColumn = {fg = c.ivory, bg = cfg.bg and c.none or c.bg0},
    ToolbarLine = {fg = c.ivory},
    Cursor = {reverse = true},
    vCursor = {reverse = true},
    iCursor = {reverse = true},
    lCursor = {reverse = true},
    CursorIM = {reverse = true},
    CursorColumn = {bg = c.bg1},
    CursorLine = {bg = c.bg1},
    ColorColumn = {bg = c.bg1},
    CursorLineNr = {fg = c.ivory},
    LineNr = {fg = c.stone},
    Conceal = {fg = c.stone, bg = c.bg1},
    DiffAdd = {fg = c.none, bg = c.diff_add},
    DiffChange = {fg = c.none, bg = c.diff_change},
    DiffDelete = {fg = c.none, bg = c.diff_delete},
    DiffText = {fg = c.none, bg= c.diff_text},
    DiffAdded = colors.sage,
    DiffRemoved = colors.coral,
    DiffFile = colors.cyan,
    DiffIndexLine = colors.stone,
    Directory = {fg = c.malibu},
    ErrorMsg = {fg = c.coral, bold = true, underline = true},
    WarningMsg = {fg = c.chalky, bold = true},
    MoreMsg = {fg = c.malibu, bold = true},
    IncSearch = {fg = c.bg0, bg = c.orange},
    Search = {fg = c.bg0, bg = c.bg_yellow},
    MatchParen = {fg = c.none, bg = c.stone},
    NonText = {fg = c.stone},
    Whitespace = {fg = c.stone},
    SpecialKey = {fg = c.stone},
    Pmenu = {fg = c.ivory, bg = c.bg1},
    PmenuSbar = {fg = c.none, bg = c.bg1},
    PmenuSel = {fg = c.bg0, bg = c.bg_blue},
    WildMenu = {fg = c.bg0, bg = c.malibu},
    PmenuThumb = {fg = c.none, bg = c.stone},
    Question = {fg = c.chalky},
    SpellBad = {fg = c.coral, underline = true, sp = c.coral},
    SpellCap = {fg = c.chalky, underline = true, sp = c.chalky},
    SpellLocal = {fg = c.malibu, underline = true, sp = c.malibu},
    SpellRare = {fg = c.violet, underline = true, sp = c.violet},
    StatusLine = {fg = c.ivory, bg = c.bg2},
    StatusLineTerm = {fg = c.ivory, bg = c.bg2},
    StatusLineNC = {fg = c.stone, bg = c.bg1},
    StatusLineTermNC = {fg = c.stone, bg = c.bg1},
    TabLine = {fg = c.ivory, bg = c.bg1},
    TabLineFill = {fg = c.stone, bg = c.bg1},
    TabLineSel =  {fg = c.bg0, bg = c.ivory},
    VertSplit = {fg = c.bg1},
    Visual = {bg = c.bg3},
    VisualNOS = {fg = c.none, bg = c.bg2, underline = true},
    QuickFixLine = {fg = c.malibu, underline = true},
    Debug = {fg = c.chalky},
    debugPC = {fg = c.bg0, bg = c.sage},
    debugBreakpoint = {fg = c.bg0, bg = c.coral},
    ToolbarButton = {fg = c.bg0, bg = c.bg_blue}
}

hl.syntax = {
    String = colors.sage,
    Character = colors.whiskey,
    Number = colors.whiskey,
    Float = colors.whiskey,
    Boolean = colors.whiskey,
    Type = colors.chalky,
    Structure = colors.chalky,
    StorageClass = colors.chalky,
    Identifier = colors.ivory,
    Constant = colors.cyan,
    PreProc = colors.violet,
    PreCondit = colors.violet,
    Include = colors.violet,
    Keyword = {fg = c.violet, italic = cfg.italics},
    Define = colors.violet,
    Typedef = colors.violet,
    Exception = colors.violet,
    Conditional = colors.violet,
    Repeat = colors.violet,
    Statement = colors.violet,
    Macro = colors.coral,
    Error = colors.violet,
    Label = colors.violet,
    Special = colors.coral,
    SpecialChar = colors.coral,
    Function = colors.malibu,
    Operator = colors.violet,
    Title = colors.cyan,
    Tag = colors.sage,
    Delimiter = colors.lightGrey,
    Comment = {fg = c.stone, italic = cfg.italics},
    SpecialComment = {fg = c.stone, italic = cfg.italics},
    Todo = {fg = c.coral, italic = cfg.italics}
}

hl.treesitter = {
    TSAnnotation = colors.ivory,
    TSAttribute = colors.cyan,
    TSBoolean = colors.whiskey,
    TSCharacter = colors.whiskey,
    TSComment = {fg = c.stone, italic = cfg.italics},
    TSConditional = colors.violet,
    TSConstant = colors.whiskey,
    TSConstBuiltin = colors.whiskey,
    TSConstMacro = colors.whiskey,
    TSConstructor = {fg = c.chalky, bold = true},
    TSError = colors.ivory,
    TSException = colors.violet,
    TSField = colors.cyan,
    TSFloat = colors.whiskey,
    TSFunction = {fg = c.malibu, bold = true},
    TSFuncBuiltin = {fg = "NONE", bg = "NONE"},
    TSFuncMacro = colors.cyan,
    TSInclude = {fg = c.violet, italic = cfg.italics},
    TSKeyword = {fg = c.violet, italic = cfg.italics},
    TSKeywordFunction = colors.violet,
    TSKeywordOperator = colors.violet,
    TSLabel = colors.coral,
    TSMethod = {fg = c.malibu, bold = true},
    TSNamespace = colors.chalky,
    TSNone = colors.ivory,
    TSNumber = colors.whiskey,
    TSOperator = colors.violet, 
    TSParameter = colors.whiskey,
    TSParameterReference = colors.ivory,
    TSProperty = colors.coral,
    TSPunctDelimiter = colors.cyan,
    TSPunctBracket = colors.ivory,
    TSPunctSpecial = colors.violet, 
    TSRepeat = colors.violet,
    TSString = colors.sage,
    TSStringRegex = colors.whiskey,
    TSStringEscape = colors.coral,
    TSSymbol = colors.cyan,
    TSTag = colors.coral,
    TSTagDelimiter = colors.coral,
    TSText = colors.ivory,
    TSStrong = colors.ivory,
    TSEmphasis = colors.ivory,
    TSUnderline = colors.ivory,
    TSStrike = colors.ivory,
    TSTitle = colors.ivory,
    TSLiteral = colors.sage,
    TSURI = colors.ivory,
    TSMath = colors.ivory,
    TSTextReference = colors.ivory,
    TSEnviroment = colors.ivory,
    TSEnviromentName = colors.ivory,
    TSNote = colors.ivory,
    TSWarning = colors.ivory,
    TSDanger = colors.ivory,
    TSType = {fg = c.ivory},
    TSTypeBuiltin = {fg = c.ivory},
    TSVariable = colors.ivory,
    TSVariableBuiltin = {fg = c.chalky, italic = cfg.italics},
            ["@type"] = {fg = "#e0e2ea"},
   
}

hl.plugins.lsp = {
    LspCxxHlGroupEnumConstant = colors.whiskey,
    LspCxxHlGroupMemberVariable = colors.whiskey,
    LspCxxHlGroupNamespace = colors.malibu,
    LspCxxHlSkippedRegion = colors.stone,
    LspCxxHlSkippedRegionBeginEnd = colors.coral,

    DiagnosticError = {fg = c.coral },
    DiagnosticHint = {fg = c.violet},
    DiagnosticInfo = {fg = c.cyan},
    DiagnosticWarn = {fg = c.chalky},

    DiagnosticVirtualTextError = { bg = cfg.diagnostics_text_bg and util.darken(cfg.darker_diagnostics and c.dark_red or c.coral, 0.1, c.bg0) or c.none,
                                   fg = cfg.darker_diagnostics and c.dark_red or c.coral },
    DiagnosticVirtualTextWarn = { bg = cfg.diagnostics_text_bg and util.darken(cfg.darker_diagnostics and c.dark_yellow or c.chalky, 0.1, c.bg0) or c.none,
                                  fg = cfg.darker_diagnostics and c.dark_yellow or c.chalky },
    DiagnosticVirtualTextInfo = { bg = cfg.diagnostics_text_bg and util.darken(cfg.darker_diagnostics and c.dark_cyan or c.cyan, 0.1, c.bg0) or c.none,
                                  fg = cfg.darker_diagnostics and c.dark_cyan or c.cyan },
    DiagnosticVirtualTextHint = { bg = cfg.diagnostics_text_bg and util.darken(cfg.darker_diagnostics and c.dark_purple or c.violet, 0.1, c.bg0) or c.none,
                                  fg = cfg.darker_diagnostics and c.dark_purple or c.violet },

    DiagnosticUnderlineError = {underline = not cfg.diagnostics_undercurl, undercurl = cfg.diagnostics_undercurl, sp = c.coral},
    DiagnosticUnderlineHint = {underline = not cfg.diagnostics_undercurl, undercurl = cfg.diagnostics_undercurl, sp = c.violet},
    DiagnosticUnderlineInfo = {underline = not cfg.diagnostics_undercurl, undercurl = cfg.diagnostics_undercurl, sp = c.malibu},
    DiagnosticUnderlineWarn = {underline = not cfg.diagnostics_undercurl, undercurl = cfg.diagnostics_undercurl, sp = c.chalky},

    LspReferenceText = {underline = true },
    LspReferenceWrite = {underline = true },
    LspReferenceRead = {underline = true }
}

hl.plugins.lsp.LspDiagnosticsDefaultError = hl.plugins.lsp.DiagnosticError
hl.plugins.lsp.LspDiagnosticsDefaultHint = hl.plugins.lsp.DiagnosticHint
hl.plugins.lsp.LspDiagnosticsDefaultInformation = hl.plugins.lsp.DiagnosticInfo
hl.plugins.lsp.LspDiagnosticsDefaultWarning = hl.plugins.lsp.DiagnosticWarn
hl.plugins.lsp.LspDiagnosticsUnderlineError = hl.plugins.lsp.DiagnosticUnderlineError
hl.plugins.lsp.LspDiagnosticsUnderlineHint = hl.plugins.lsp.DiagnosticUnderlineHint
hl.plugins.lsp.LspDiagnosticsUnderlineInformation = hl.plugins.lsp.DiagnosticUnderlineInfo
hl.plugins.lsp.LspDiagnosticsUnderlineWarning = hl.plugins.lsp.DiagnosticUnderlineWarn
hl.plugins.lsp.LspDiagnosticsVirtualTextError = hl.plugins.lsp.DiagnosticVirtualTextError
hl.plugins.lsp.LspDiagnosticsVirtualTextWarning = hl.plugins.lsp.DiagnosticVirtualTextWarn
hl.plugins.lsp.LspDiagnosticsVirtualTextInformation = hl.plugins.lsp.DiagnosticVirtualTextInfo
hl.plugins.lsp.LspDiagnosticsVirtualTextHint = hl.plugins.lsp.DiagnosticVirtualTextHint

hl.plugins.cmp = {
    CmpItemAbbr = colors.ivory,
    CmpItemAbbrDeprecated = colors.ivory,
    CmpItemAbbrMatch = colors.cyan,
    CmpItemAbbrMatchFuzzy = { fg = c.cyan, underline = true },
    CmpItemKind = colors.violet,
    CmpItemMenu = colors.lightGrey,
}

hl.plugins.whichkey = {
    WhichKey = colors.coral,
    WhichKeyDesc = colors.malibu,
    WhichKeyGroup = colors.whiskey,
    WhichKeySeperator = colors.sage
}

hl.plugins.gitgutter = {
    GitGutterAdd = colors.sage,
    GitGutterChange = colors.malibu,
    GitGutterDelete = colors.coral,
}

hl.plugins.hop = {
    HopNextKey = {fg = c.coral},
    HopNextKey1 = {fg = c.cyan, bold = true},
    HopNextKey2 = {fg = util.darken(c.cyan,0.9, c.bg0)},
    HopUnmatched = {fg = util.darken(c.ivory,0.9, c.bg0) , bg = cfg.bg and c.none or c.bg1},
}

hl.plugins.diffview = {
    DiffviewFilePanelTitle = {fg = c.malibu, bold = true},
    DiffviewFilePanelCounter = {fg = c.violet, bold = true},
    DiffviewFilePanelFileName = colors.ivory,
    DiffviewNormal = hl.common.Normal,
    DiffviewCursorLine = hl.common.CursorLine,
    DiffviewVertSplit = hl.common.VertSplit,
    DiffviewSignColumn = hl.common.SignColumn,
    DiffviewStatusLine = hl.common.StatusLine,
    DiffviewStatusLineNC = hl.common.StatusLineNC,
    DiffviewEndOfBuffer = hl.common.EndOfBuffer,
    DiffviewFilePanelRootPath = colors.stone,
    DiffviewFilePanelPath = colors.stone,
    DiffviewFilePanelInsertions = colors.sage,
    DiffviewFilePanelDeletions = colors.coral,
    DiffviewStatusAdded = colors.sage,
    DiffviewStatusUntracked = colors.malibu,
    DiffviewStatusModified = colors.malibu,
    DiffviewStatusRenamed = colors.malibu,
    DiffviewStatusCopied = colors.malibu,
    DiffviewStatusTypeChange = colors.malibu,
    DiffviewStatusUnmerged = colors.malibu,
    DiffviewStatusUnknown = colors.coral,
    DiffviewStatusDeleted = colors.coral,
    DiffviewStatusBroken = colors.coral
}

hl.plugins.gitsigns = {
    GitSignsAdd = colors.sage,
    GitSignsAddLn = colors.sage,
    GitSignsAddNr = colors.sage,
    GitSignsChange = colors.malibu,
    GitSignsChangeLn = colors.malibu,
    GitSignsChangeNr = colors.malibu,
    GitSignsDelete = colors.coral,
    GitSignsDeleteLn = colors.coral,
    GitSignsDeleteNr = colors.coral
}

hl.plugins.nvim_tree = {
    NvimTreeNormal = { fg = c.ivory, bg = cfg.bg and c.none or c.bg_d },
    NvimTreeVertSplit = { fg = c.bg_d, bg = cfg.bg and c.none or c.bg_d },
    NvimTreeEndOfBuffer = { fg = cfg.hide_ending_tildes and c.bg_d or c.bg2, bg =  cfg.bg and c.none or c.bg_d },
    NvimTreeRootFolder = { fg = c.orange, bold = true },
    NvimTreeGitDirty = colors.chalky,
    NvimTreeGitNew = colors.sage,
    NvimTreeGitDeleted = colors.coral,
    NvimTreeSpecialFile = { fg = c.chalky, underline=true },
    NvimTreeIndentMarker = colors.ivory,
    NvimTreeImageFile = { fg = c.dark_purple },
    NvimTreeSymlink = colors.violet,
    NvimTreeFolderName = colors.malibu,
}
hl.plugins.telescope = {
    TelescopeBorder = colors.coral,
    TelescopePromptBorder = colors.cyan,
    TelescopeResultsBorder = colors.cyan,
    TelescopePreviewBorder = colors.cyan,
    TelescopeMatching = { fg = c.orange, bold = true },
    TelescopePromptPrefix = colors.sage,
    TelescopeSelection =  { bg =c.bg2 },
    TelescopeSelectionCaret = colors.chalky
}

hl.plugins.dashboard = {
    DashboardShortCut = colors.malibu,
    DashboardHeader = colors.chalky,
    DashboardCenter = colors.cyan,
    DashboardFooter = { fg = c.dark_red, italic = true}
}

hl.plugins.symbols_outline = {
    FocusedSymbol = { fg = c.bg1, bg = c.chalky, bold = true },
}

hl.plugins.ts_rainbow = {
    rainbowcol1 = colors.stone,
    rainbowcol2 = colors.chalky,
    rainbowcol3 = colors.malibu,
    rainbowcol4 = colors.whiskey,
    rainbowcol5 = colors.violet,
    rainbowcol6 = colors.sage,
    rainbowcol7 = colors.coral
}

-- hl.langs.c = {
--     cInclude = colors.malibu,
--     cStorageClass = colors.violet,
--     cTypedef = colors.violet,
--     cDefine = colors.cyan,
--     cTSInclude = colors.malibu,
--     cTSConstant = colors.cyan,
--     cTSConstMacro = colors.violet,
-- }

-- hl.langs.cpp = {
--     cppStatement = { fg = c.violet, bold = true },
--     cppTSInclude = colors.malibu,
--     cppTSConstant = colors.cyan,
--     cppTSConstMacro = colors.violet,
-- }

-- hl.langs.markdown = {
--     markdownBlockquote = colors.stone,
--     markdownBold = {fg = c.none, bold = true},
--     markdownBoldDelimiter = colors.stone,
--     markdownCode = colors.sage,
--     markdownCodeBlock = colors.sage,
--     markdownCodeDelimiter = colors.chalky,
--     markdownH1 = {fg = c.coral, bold = true},
--     markdownH2 = {fg = c.violet, bold = true},
--     markdownH3 = {fg = c.orange, bold = true},
--     markdownH4 = {fg = c.coral, bold = true},
--     markdownH5 = {fg = c.violet, bold = true},
--     markdownH6 = {fg = c.orange, bold = true},
--     markdownHeadingDelimiter = colors.stone,
--     markdownHeadingRule = colors.stone,
--     markdownId = colors.chalky,
--     markdownIdDeclaration = colors.coral,
--     markdownItalic = {fg = c.none, italic = true},
--     markdownItalicDelimiter = {fg = c.stone, italic = true},
--     markdownLinkDelimiter = colors.stone,
--     markdownLinkText = colors.coral,
--     markdownLinkTextDelimiter = colors.stone,
--     markdownListMarker = colors.coral,
--     markdownOrderedListMarker = colors.coral,
--     markdownRule = colors.violet,
--     markdownUrl = {fg = c.malibu, underline = true},
--     markdownUrlDelimiter = colors.stone,
--     markdownUrlTitleDelimiter = colors.sage
-- }

-- hl.langs.php = {
--     phpFunctions = colors.ivory,
--     phpMethods = colors.cyan,
--     phpStructure = colors.violet,
--     phpOperator = colors.violet,
--     phpMemberSelector = colors.ivory,
--     phpVarSelector = colors.whiskey,
--     phpIdentifier = colors.whiskey,
--     phpBoolean = colors.cyan,
--     phpNumber = colors.whiskey,
--     phpHereDoc = colors.sage,
--     phpNowDoc = colors.sage,
--     phpSCKeyword = colors.violet,
--     phpFCKeyword = colors.violet,
--     phpRegion = colors.malibu
-- }

-- hl.langs.scala = {
--     scalaNameDefinition = colors.ivory,
--     scalaInterpolationBoundary = colors.violet,
--     scalaInterpolation = colors.violet,
--     scalaTypeOperator = colors.coral,
--     scalaOperator = colors.coral,
--     scalaKeywordModifier = colors.coral
-- }

-- hl.langs.tex = {
--     latexTSInclude = colors.malibu,
--     latexTSFuncMacro = colors.violet,
--     latexTSEnvironment = { fg = c.cyan, bold = true },
--     latexTSEnvironmentName = colors.chalky,
--     texCmdEnv = colors.cyan,
--     texEnvArgName = colors.chalky,
--     latexTSTitle = colors.sage,
--     latexTSType = colors.malibu,
--     latexTSMath   = colors.whiskey,
--     texMathZoneX  = colors.whiskey,
--     texMathZoneXX = colors.whiskey,
--     texMathDelimZone = colors.lightGrey,
--     texMathDelim = colors.violet,
--     texMathOper = colors.coral,
--     texCmd = colors.violet,
--     texCmdPart = colors.malibu,
--     texCmdPackage = colors.malibu,
--     texPgfType = colors.chalky,
-- }

-- hl.langs.vim = {
--     vimTSFuncMacro = {fg = c.cyan, bold = true},
--     vimCommentTitle = {fg = c.light_grey, bold = true},
--     vimCommand =  {fg = c.cyan, bold = true},
--     vimLet = colors.violet,
--     vimFunction = colors.malibu,
--     vimIsCommand = colors.ivory,
--     vimUserFunc = colors.malibu,
--     vimFuncName = colors.malibu,
--     vimMap = colors.violet,
--     vimMapModKey = colors.whiskey,
--     vimNotation = colors.coral,
--     vimMapLhs = colors.malibu,
--     vimMapRhs = colors.malibu,
--     vimOption = colors.coral,
--     vimUserAttrbKey = colors.coral,
--     vimUserAttrb = colors.malibu,
--     vimSynType = colors.cyan,
--     vimHiBang = colors.violet,
--     vimSet = colors.chalky,
--     vimSetEqual = colors.chalky,
--     vimSetSep = colors.lightGrey,
--     vimVar = colors.ivory,
--     vimFuncVar = colors.ivory,
--     vimContinue = colors.stone,
--     vimAutoCmdSfxList = colors.cyan,
-- }
function M.setup()
    vim_highlights(hl.common)
    vim_highlights(hl.syntax)
    vim_highlights(hl.treesitter)
    -- for _, group in pairs(hl.langs) do vim_highlights(group) end
    for _, group in pairs(hl.plugins) do vim_highlights(group) end
    vim.cmd([[syntax match StdWord /\<std\>/]])
    vim.cmd([[highlight link StdWord Identifier]])
end
        vim.cmd([[highlight MinhaPalavra guifg=#ff0000 guibg=#000000 gui=bold]])
vim.cmd([[syntax match MinhaPalavra /\<teste\>/]])

return M
