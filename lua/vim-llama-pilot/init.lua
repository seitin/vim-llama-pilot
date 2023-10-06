local M = require("vim-llama-pilot.ai-request")

local host = "127.0.0.1"
local port = 11434
local question = arg[1]
local model = "llama2:latest"
M.RequestAIResponse(host, port, question, model)

return M
