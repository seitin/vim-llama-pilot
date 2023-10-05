local http_request = require("http.request")
local json = require("lunajson")
local io = require("io")

local host = "127.0.0.1"
local port = 11434

function PrintSameLine(...)
  local n = select("#",...)
  for i = 1,n do
    local v = tostring(select(i,...))
    io.write(v)
    if i~=n then io.write'\t' end
    io.flush()
  end
end

function RequestAIResponse(host, port, question, model)
  local path = "/api/generate"
  local url = "http://" .. host .. ":" .. port .. path

  local request_obj = http_request.new_from_uri(url)

  request_obj.headers:delete(":method")
  request_obj.headers:append(":method", "POST")

  local data = {
    prompt = question,
    model = model
  }

  local request_body = json.encode(data)
  request_obj:set_body(request_body)

  local _, stream = assert(request_obj:go())

  while true do
    local response = stream:get_next_chunk(10)
    response = json.decode(response)
    if response.done then break end
    PrintSameLine(response.response)
  end
end

local question = arg[1]
local model = "llama2:latest"
RequestAIResponse(host, port, question, model)
