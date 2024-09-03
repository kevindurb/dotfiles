return {
  'robitx/gp.nvim',
  opts = {
    providers = {
      ollama = {
        endpoint = 'http://localhost:11434/v1/chat/completions',
      },
    },
    agents = {
      {
        provider = 'ollama',
        name = 'ChatOllamaLlama3.1-8B',
        chat = true,
        command = false,
        model = {
          model = 'llama3.1',
          temperature = 0.6,
          top_p = 1,
          min_p = 0.05,
        },
        system_prompt = 'You are a general AI assistant.',
      },
    },
  },
}
