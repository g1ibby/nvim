local litellm_endpoint = os.getenv("LITELLM_ENDPOINT")
if not litellm_endpoint then
  error("Avante Error: LITELLM_ENDPOINT environment variable is not set.")
end

return {
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- Optional dependencies ---
      "echasnovski/mini.pick",
      "nvim-telescope/telescope.nvim",
      "hrsh7th/nvim-cmp",
      "ibhagwan/fzf-lua",
      "nvim-tree/nvim-web-devicons",
      "zbirenbaum/copilot.lua",
      "ravitemer/mcphub.nvim",
      {
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = { insert_mode = true },
            use_absolute_path = true,
          },
        },
      },
      {
        "MeanderingProgrammer/render-markdown.nvim",
        opts = { file_types = { "markdown", "Avante" } },
        ft = { "markdown", "Avante" },
      },
    },
    opts = {
      -- === Core Provider Settings ===
      provider = "litellm-sonnet3.7", -- Default model
      cursor_applying_provider = "litellm-llama70b", -- For cursor planning mode
      memory_summary_provider = "litellm-gpt4o-mini", -- For history summarization

      -- === Custom LiteLLM Providers ===
      vendors = {
        -- Model definitions using exact names for LiteLLM API calls
        -- Common settings are now duplicated in each entry
        ["litellm-gpt4o"] = {
          __inherited_from = "openai", -- Still useful to inherit base structure/defaults
          endpoint = litellm_endpoint, -- Use the checked environment variable
          api_key_name = "LITELLM_API_KEY",
          model = "gpt4o",
          display_name = "LiteLLM GPT-4o",
          temperature = 0.7,
          max_tokens = 16384,
        },
        ["litellm-sonnet3.7"] = {
          __inherited_from = "openai",
          endpoint = litellm_endpoint,
          api_key_name = "LITELLM_API_KEY",
          model = "sonnet3.7",
          display_name = "LiteLLM Sonnet 3.7",
          temperature = 0.7,
          max_tokens = 16384, -- Increased max tokens
        },
        ["litellm-sonnet3.5"] = {
          __inherited_from = "openai",
          endpoint = litellm_endpoint,
          api_key_name = "LITELLM_API_KEY",
          model = "sonnet3.5",
          display_name = "LiteLLM Sonnet 3.5",
          temperature = 0.7,
          max_tokens = 16384, -- Increased max tokens
        },
        ["litellm-llama70b"] = {
          __inherited_from = "openai",
          endpoint = litellm_endpoint,
          api_key_name = "LITELLM_API_KEY",
          model = "llama70b",
          display_name = "LiteLLM Llama 70B",
          temperature = 0.6,
          max_tokens = 16384, -- Llama 3 70B context window
        },
        ["litellm-gemini-2.5-pro-exp"] = {
          __inherited_from = "openai",
          endpoint = litellm_endpoint,
          api_key_name = "LITELLM_API_KEY",
          model = "gemini-2.5-pro-exp-03-25",
          display_name = "LiteLLM Gemini 2.5 Pro Exp",
          temperature = 0.9,
          max_tokens = 16384, -- Increased max tokens
        },
        ["litellm-gpt4o-mini"] = {
          __inherited_from = "openai",
          endpoint = litellm_endpoint,
          api_key_name = "LITELLM_API_KEY",
          model = "gpt-4o-mini",
          display_name = "LiteLLM GPT-4o Mini",
          temperature = 0.7,
          max_tokens = 16384, -- Increased max tokens
        },
      },

      -- === Behaviour Overrides ===
      behaviour = {
        jump_result_buffer_on_finish = true,
        support_paste_from_clipboard = true,
        enable_cursor_planning_mode = true,
      },

      -- === Mapping Overrides ===
      mappings = {
        diff = {
          ours = "<leader>aco",
          theirs = "<leader>act",
        },
      },

      -- === Hint Configuration ===
      hints = {
        enabled = true,
      },
      system_prompt = function()
        local hub = require("mcphub").get_hub_instance()
        return hub:get_active_servers_prompt()
      end,
      -- The custom_tools type supports both a list and a function that returns a list. Using a function here prevents requiring mcphub before it's loaded
      custom_tools = function()
        return {
          require("mcphub.extensions.avante").mcp_tool(),
        }
      end,
    },
    build = "make",
  },
}
