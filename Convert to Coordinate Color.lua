local sprite = app.activeSprite

if not sprite then
    return
end

local selection = sprite.selection

if sprite.selection.isEmpty then
    return
end

local origin = selection.origin
local cell = app.activeCel --ridiculous spelling corrected
local image = cell.image

local target = Point(origin.x - cell.position.x, origin.y - cell.position.y)
local pixelValue = image:getPixel(target.x, target.y)
local color = Color(pixelValue)

app.fgColor = Color({
    r = origin.x,
    g = (sprite.height - 1 - origin.y), --Coordinates start at bottom because Unity is fat; subtraction is necessary for some reason
    z = 0, --Doesn't really matter yet
    a = color.alpha
})


--[[ for later :) function init(plugin)
    print("aseprite starting my f")

    plugin:newCommand({
        id = "MyFirstCommand",
        title = "My First Command",
        group = "view_controls",
        onenabled = function()
            return app.activeSprite ~= nil
        end,
        onclick = function()
            print("fhsddsj")
        end
    })
end

function exit(plugin)
    print("exiting")
end]]