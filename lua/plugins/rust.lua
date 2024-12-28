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
                  ["async-recursion"] = { "async_recursion" },
                },
              },
            },
          },
        },
      }
    end,
  },
}
