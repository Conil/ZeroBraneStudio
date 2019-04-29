--[[--
  Use this file to specify **User** preferences.
  Review [examples](+user-sample.lua) or check [online documentation](http://studio.zerobrane.com/documentation.html) for details.
--]]--

-- Load Sprout API for auto-complete
api = {"sprout"}

-- Editor config
editor.tabwidth = 4
editor.usetabs = false
acandtip.nodynwords = false -- do not offer dynamic (user entered) words; set to false to collect all words from all open editor tabs and offer them as part of the auto-complete list.
acandtip.shorttip = false -- show short calltip when typing; set to false to show a long calltip.
debugger.runonstart = true -- Don't stop on the first line when debugging starts; stop at first breakpoint

-- Auxiliar functions for color conversion
local function h2d(n) return 0+('0x'..n) end
local function H(c, bg) c = c:gsub('#','')
  -- since alpha is not implemented, convert RGBA to RGB
  -- assuming 0 is transparent and 255 is opaque
  -- based on http://stackoverflow.com/a/2645218/1442917
  local bg = bg and H(bg) or {255, 255, 255}
  local a = #c > 6 and h2d(c:sub(7,8))/255 or 1
  local r, g, b = h2d(c:sub(1,2)), h2d(c:sub(3,4)), h2d(c:sub(5,6))
  return {
    math.min(255, math.floor((1-a)*bg[1]+a*r)),
    math.min(255, math.floor((1-a)*bg[2]+a*g)),
    math.min(255, math.floor((1-a)*bg[3]+a*b))}
end

-- Color scheme
local colors = {
  HyLightTheme = {
    Background   = H'ffffff', -- white
    Text         = H'2e2e2e', -- black
    CurrentLine  = H'efefef', -- gray
    Selection    = H'd6d6d6', -- dark gray
    Keyword      = H'4069ff', -- lightish-blue
    FunctionCall = H'2f7d00', -- green
    Comment      = H'838383', -- light gray
    String       = H'9d0000', -- pink
    Number       = H'7593ff', -- turquoise
    Operator     = H'f1542b', -- orange
    FoldActive   = H'4069ff', -- Hyperganic blue
  }
}

C = colors.HyLightTheme

-- do not underline variables and function calls
styles.indicator.fncall     = nil
styles.indicator.varglobal  = nil
styles.indicator.varlocal   = nil
styles.indicator.varmasking = nil
styles.indicator.varmasked  = nil
styles.indicator.varself    = nil

-- Lexer specific (inherit fg/bg from text)
styles.lexerdef     = { fg = {255, 0, 0} }
styles.comment      = { fg = C.Comment }
styles.stringtxt    = { fg = C.String }
styles.stringeol    = { fg = {128, 32, 16}, bg = {224, 192, 224}, fill = true } -- when quotes aren't closed
styles.preprocessor = { fg = C.FunctionCall }
styles.operator     = { fg = C.Operator }
styles.number       = { fg = C.Number }

-- Keywords
styles.keywords0 = { fg = C.Keyword, b = false, u = false } -- Reserved keywords: local / function / return / if / then / else / for / not / etc
styles.keywords1 = { fg = C.Keyword, b = false, u = false } -- Boolean operators: true / false
styles.keywords2 = { fg = C.FunctionCall, b = false, u = false } -- Lua built-in functions: print / tonumber / loadfile / ipairs / type / pcall / etc
styles.keywords3 = { fg = C.Keyword, b = false, u = false }
styles.keywords4 = { fg = C.Keyword, b = false, u = false }
styles.keywords5 = { fg = C.Keyword, b = false, u = false }
styles.keywords6 = { fg = C.Keyword, b = false, u = false }
styles.keywords7 = { fg = C.Keyword, b = false, u = false }

-- Common (inherit fg/bg from text)
styles.text       = { fg = C.Text, bg = C.Background }
styles.linenumber = { fg = C.Text, bg = C.Background }
styles.bracematch = { fg = {32, 128, 255}, b = true }
styles.bracemiss  = { fg = {255, 128, 32}, b = true }
styles.ctrlchar   = {}
styles.indent     = { fg = {192, 192, 230}, bg = {255, 255, 255} }
styles.calltip    = {}

-- Common special (need custom fg & bg)
styles.sel         = { bg = C.Selection }
styles.caret       = { fg = {0, 0, 0} }
styles.caretlinebg = { bg = C.CurrentLine }
styles.fold        = { fg = C.Comment, bg = C.Background, sel = C.FoldActive }
styles.whitespace  = {}
styles.edge        = {}

-- Copy styles
stylesoutshell   = styles      -- apply the same scheme to Output/Console windows
styles.auxwindow = styles.text -- apply text colors to auxiliary windows
styles.calltip   = styles.text -- apply text colors to tooltips

-- File tree
filetree.iconmap.lua = {fg = {255, 0, 0}}
filetree.iconmap.xml = {fg = {0, 0, 255}}

-- Fonts
-- TODO: Read fonts from file
editor.fontname   = "Roboto Mono"
editor.fontsize   = 10
output.fontname   = "Roboto Mono"
console.fontname  = "Roboto Mono"
filetree.fontname = "Open Sans"
filetree.fontsize = 10