return {
  'robitx/gp.nvim',
  config = function()
    local opts = {
      default_chat_agent = 'ChatOllamaLlama3.1-8B',
      default_command_agent = 'CodeOllamaLlama3.1-8B',
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
          -- string with model name or table with model name and parameters
          model = {
            model = 'llama3.1:8b',
            temperature = 0.6,
            top_p = 1,
            min_p = 0.05,
          },
          -- system prompt (use this to specify the persona/role of the AI)
          system_prompt = 'You are a general AI assistant.',
        },
        {
          provider = 'ollama',
          name = 'CodeOllamaLlama3.1-8B',
          chat = false,
          command = true,
          -- string with model name or table with model name and parameters
          model = {
            model = 'llama3.1:8b',
            temperature = 0.4,
            top_p = 1,
            min_p = 0.05,
          },
          -- system prompt (use this to specify the persona/role of the AI)
          system_prompt = require('gp').defaults.code_system_prompt,
        },
      },
    }

    require('gp').setup(opts)
  end,
}
