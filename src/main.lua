local PACKAGE = "com.frqstbite.ashsprite"
local COMMAND_NAMES = {
  "coordinateColor"
}


print("Initializing Ashsprite commands...")
local commands = {}

for _, name in next, COMMAND_NAMES do
  local id = (PACKAGE .. ":" .. name)
    local path = ("./commands/" .. name .. ".lua")
    print("Initializing command " .. id .. "...")

    commands[name] = dofile(path)
    print("Done!")
end


function init(plugin)
    print("Ashsprite initializing...")

    -- Load commands
    for id, command in next, commands do
      print("Adding command " .. id .. "...")

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