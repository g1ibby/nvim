return {
  {
    "mrcjkb/rustaceanvim",
    opts = function()
      return {
        server = {
          default_settings = {
            ["rust-analyzer"] = {
              procMacro = {
                enable = true,
                ignored = {
                  ["napi-derive"] = { "napi" },
                },
              },
              -- Use the rust-analyzer component directly
              server = {
                path = "rust-analyzer",
              },
            },
          },
        },
      }
    end,
  },
}
