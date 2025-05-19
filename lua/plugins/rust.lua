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
              -- Add cargo features configuration here
              cargo = {
                features = { "integration-tests" },
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
