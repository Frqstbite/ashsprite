local PACKAGE = "com.frqstbite.ashsprite"
local COMMANDS = {
  "coordinateColor"
}


function init(plugin)
    print("Ashsprite initializing...")

    -- Load commands
    for _, name in next, COMMANDS do
      local id = (PACKAGE .. ":" .. name)
      print("Adding command" .. id .. "...")

      local command = require("./commands/" .. name .. ".lua")
      print("Required...")

      plugin:newCommand({
        id = id,
        title = command.Display,
        group = command.Group,
        onenabled = command.CanRun,
        onclick = command.Run,
      })

      print("Added command " .. id .. "!")
    end
  end

  --[[function exit(plugin)
    --Might do something??
  end]]