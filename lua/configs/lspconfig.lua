require("nvchad.configs.lspconfig").defaults()

local vue_language_server_path = vim.fs.joinpath(
    vim.fn.stdpath "data",
    "mason",
    "packages",
    "vue-language-server",
    "node_modules",
    "@vue",
    "language-server"
)

vim.lsp.config("ts_ls", {
    init_options = {
        hostInfo = "neovim",
        plugins = {
            {
                name = "@vue/typescript-plugin",
                location = vue_language_server_path,
                languages = { "vue" },
                configNamespace = "typescript",
            },
        },
    },
    filetypes = {
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
        "vue",
    },
})

vim.lsp.config("clangd", {
    cmd = {
        "clangd",
        "--background-index",
        "--clang-tidy",
    },
})

local servers = {
    "bashls",
    "clangd",
    "svelte",
    "css_variables",
    "cssls",
    "fish_lsp",
    "gopls",
    "html",
    "jsonls",
    "lua_ls",
    "rust_analyzer",
    "ts_ls",
    "vue_ls",
    "yamlls",
    "jdtls",
}

vim.lsp.enable(servers)
