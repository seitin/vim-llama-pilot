package = "vim-llama-pilot"
version = "dev-1"
source = {
   url = "git+ssh://git@github.com/seitin/vim-llama-pilot.git"
}
description = {
   homepage = "https://github.com/seitin/vim-llama-pilot.git",
   license = "*** please specify a license ***"
}
build = {
   type = "builtin",
   modules = {
      ["vim-llama-pilot.ai-request"] = "lua/vim-llama-pilot/ai-request.lua",
      ["vim-llama-pilot.init"] = "lua/vim-llama-pilot/init.lua"
   }
}
dependencies = {
  "lua >= 5.4",
  "http >= 0.4-0",
  "lunajson >=  1.2.3-1"
}
