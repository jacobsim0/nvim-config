return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      -- label the leader-key groups so the popup reads nicely
      spec = {
        { "<leader>f", group = "find (telescope)" },
        { "<leader>h", group = "git hunks" },
        { "<leader>c", group = "code" },
        { "<leader>b", group = "buffers (file tabs)" },
      },
    },
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer-local keymaps",
      },
    },
  },
}
