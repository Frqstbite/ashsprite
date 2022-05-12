local Command = {
    Display = "Get Coordinate Color of Selected Pixel",
    Group = "edit_insert", --best i could find
}


function Command.CanRun()
    local sprite = app.activeSprite
    if not sprite then
        return false
    end

    local selection = sprite.selection
    local bounds = selection.bounds
    if (bounds.width * bounds.height ~= 1) then --If the selection is empty or larger than one pixel, this command is not available
        return false
    end

    return true
end


function Command.Run()
    if not Command.CanRun() then --We check this just in case a keybind executes it
        return --TODO: this is probably not necessary
    end

    local sprite = app.activeSprite --File holding all the frames/layers
    local cell = app.activeCel --Clump of pixels that lives on a frame/layer; ridiculous spelling corrected
    local image = cell.image --All pixels that live on the frame/layer

    local selection = sprite.selection
    local origin = selection.origin

    local target = Point(origin.x - cell.position.x, origin.y - cell.position.y) --Convert selection coordinates to cell coordinates (0,0 is the top left of the cell)
    local pixelValue = image:getPixel(target.x, target.y)
    local color = Color(pixelValue) --Pixel value is a stupid integer that we convert to a color this way

    app.fgColor = Color({
        r = origin.x, --X value is correct
        g = (sprite.height - 1 - origin.y), --Coordinates start at bottom because Unity is fat; subtracting 1 is necessary because height does not start at zero
        z = 0, --Doesn't really matter yet
        a = color.alpha --Alpha is pulled from map, not atlas; thus, we must transfer alpha too
    })
end


return Command