function init(plugin)
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
end