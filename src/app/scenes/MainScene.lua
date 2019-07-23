
local RubCardLayer = require("app.views.RubCardLayer")
local MainScene = class("MainScene", function()
    return display.newScene("MainScene")
end)

function MainScene:ctor()

    
  
      --显示搓牌效果
    local cardValue = 35
    local szBack =  display.newSprite("big_poker_255.png")
    local szFont = display.newSprite("big_poker_261.png")
    local szEnd =  display.newSprite("big_poker_26.png")
    local posX = display.cx
    local posY = display.cy
    local layer = RubCardLayer.new( cardValue,szBack, szFont,szEnd, posX, posY, function()
        print("结束");
    end)
    self:addChild(layer)
end

function MainScene:onEnter()
end

function MainScene:onExit()
end

return MainScene
