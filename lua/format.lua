local eslint = {
  lintCommand = "eslint_d -f visualstudio --stdin --stdin-filename ${INPUT}",
  lintFormats = {"%f(%l,%c): %tarning %m", "%f(%l,%c): %trror %m"},
  lintStdin = true,
  lintIgnoreExitCode = true,
  lintSource = "eslint",
  formatCommand = "eslint_d --fix-to-stdout --stdin --stdin-filename ${INPUT}",
  formatStdin = true
}

local jq = {
  lintCommand = "jq .",
  lintFormats = {"parse %trror: %m at line %l, column %c"},
  lintSource = "jq"
}

local prettier = {
  formatCommand = "prettier --stdin-filepath ${INPUT}",
  formatStdin = true,
}

local shellcheck = {
  lintCommand = "shellcheck -f gcc -x -",
  lintStdin = true,
  lintFormats = {
    "%f:%l:%c: %trror: %m", "%f:%l:%c: %tarning: %m", "%f:%l:%c: %tote: %m"
  },
  lintSource = "shellcheck"
}

return {
  css = {prettier},
  html = {prettier},
  javascript = {prettier, eslint},
  javascriptreact = {prettier, eslint},
  json = {prettier, jq},
  markdown = {prettier},
  pandoc = {prettier},
  sh = {shellcheck},
  typescript = {prettier, eslint},
  typescriptreact = {prettier, eslint},
  yaml = {prettier}
}
