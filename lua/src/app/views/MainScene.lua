
local MainScene = class("MainScene", cc.load("mvc").ViewBase)


-- MainScene.RESOURCE_FILENAME = "MainScene.csb"

function MainScene:onCreate()

print('1');

    local sdkboxads = sdkbox.PluginSdkboxAds

print('2');

    sdkboxads:init()
    sdkboxads:setListener(function(event)
        dump(event)
        local funcname = event.name
    end)

print('3');
	cc.MenuItemFont:setFontName("Arial")
    local menu = cc.Menu:create(
                   cc.MenuItemFont:create("AdColony Video"):onClicked(function()
                        sdkboxads:playAd("AdColony", "video", {} )
                    end),
                   cc.MenuItemFont:create("AdColony Reward"):onClicked(function()
                        sdkboxads:playAd("AdColony", "v4vc", {} )
                    end),
                   cc.MenuItemFont:create("AdMob insterstitial"):onClicked(function()
                        sdkboxads:playAd("AdMob", "gameover", {} )
                    end),
                   cc.MenuItemFont:create("Bee7 gamewall"):onClicked(function()
                        sdkboxads:playAd("Bee7", "any", {} )
                    end),
                   cc.MenuItemFont:create("Chartboost Insterstitial"):onClicked(function()
                        sdkboxads:playAd("Chartboost", "Default", {} )
                    end),
                   cc.MenuItemFont:create("Chartboost Rewarded"):onClicked(function()
                        sdkboxads:playAd("Chartboost", "Level Complete", {} )
                    end),
                    cc.MenuItemFont:create("Fyber Video"):onClicked(function()
                        sdkboxads:playAd("Fyber", "INTERSTITIAL", {} )
                    end),
                    cc.MenuItemFont:create("Fyber Reward"):onClicked(function()
                        sdkboxads:playAd("Fyber", "REWARDED", {} )
                    end),
                    cc.MenuItemFont:create("Vungle Interstitial"):onClicked(function()
                        sdkboxads:playAd("Vungle", "video", {} )
                    end),
                    cc.MenuItemFont:create("Vungle Reward"):onClicked(function()
                        sdkboxads:playAd("Vungle", "reward", {} )
                    end),
                    cc.MenuItemFont:create("Default ad"):onClicked(function()
                        sdkboxads:playAd()
                    end),
                    cc.MenuItemFont:create("Placement 1"):onClicked(function()
                        sdkboxads:placement("placement-1")
                    end),
                    cc.MenuItemFont:create("Placement 2"):onClicked(function()
                        sdkboxads:placement("placement-2")
                    end)

                   )
        :move(display.cx, display.cy)
        :addTo(self)
        :alignItemsVerticallyWithPadding(20)

    self:addChild( menu )
end

return MainScene
