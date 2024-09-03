return {
  'robitx/gp.nvim',
  opts = {
    providers = {
      ollama = {
        endpoint = 'http://localhost:11434/v1/chat/completions',
      },
    },
  },
}
