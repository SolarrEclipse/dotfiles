require "nvchad.options"

-- add yours here!

local o = vim.o
local opt = vim.opt

o.cursorlineopt = "both" -- to enable cursorline!

if vim.fn.has "wsl" == 1 then
  o.clipboard = "unnamedplus"

  if vim.fn.executable "wl-copy" == 1 and vim.fn.executable "wl-paste" == 1 then
    vim.g.clipboard = "wl-copy"
  else
    vim.g.clipboard = {
      name = "WslClipboard",
      copy = {
        ["+"] = { "clip.exe" },
        ["*"] = { "clip.exe" },
      },
      paste = {
        ["+"] = { "powershell.exe", "-NoLogo", "-NoProfile", "-Command", "[Console]::Out.Write((Get-Clipboard -Raw).Replace(\"`r\", \"\"))" },
        ["*"] = { "powershell.exe", "-NoLogo", "-NoProfile", "-Command", "[Console]::Out.Write((Get-Clipboard -Raw).Replace(\"`r\", \"\"))" },
      },
      cache_enabled = 0,
    }
  end
else
  o.clipboard = "unnamedplus"
end

o.shiftwidth = 4
o.expandtab = true

opt.number = true
opt.relativenumber = true
opt.tabstop = 4
opt.wrap = false
opt.ignorecase = true
opt.smartcase = true
opt.termguicolors = true
opt.scrolloff = 8
opt.signcolumn = "yes"
