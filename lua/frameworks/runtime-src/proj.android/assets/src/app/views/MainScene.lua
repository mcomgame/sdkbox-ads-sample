
local MainScene = class("MainScene", cc.load("mvc").ViewBase)

-- MainScene.RESOURCE_FILENAME = "MainScene.csb"

function MainScene:onCreate()

	cc.MenuItemFont:setFontName("Arial")
    cc.Menu:create(
                   cc.MenuItemFont:create("clickme"):onClicked(function()
                        print("on click")
                    end)
                   )
        :move(display.cx, display.cy)
        :addTo(self)
        :alignItemsVerticallyWithPadding(20)

    cc.Label:createWithSystemFont("Hello Lua", "Arial", 64)
    		:move(display.cx, display.height/5)
		    :addTo(self)
end

return MainScene
