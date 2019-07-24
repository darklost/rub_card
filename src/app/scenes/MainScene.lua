
local RubCardLayer = require("app.views.RubCardLayer_new")
local MainScene = class("MainScene", function()
    return display.newScene("MainScene")
end)

function MainScene:ctor()

    
    dump(RubCardLayer,'RubCardLayer')
      --显示搓牌效果
    local cardValue = 35
    local szBack =  display.newSprite("big_poker_255.png")
    local szFont = display.newSprite("big_poker_261.png")
    local szEnd =  display.newSprite("big_poker_26.png")
    local posX = display.cx
    local posY = display.cy
    local path_back = "big_poker_255.png"
	local path_front_blank = "big_poker_261.png" 
	local path_front = "big_poker_26.png" 
    local view = require("app.views.RubCardLayer_new"):create(path_back, path_front_blank, path_front, posX, posY, false, function() 
		print("=================dff  finish")
	end)
	self:addChild(view) 
    -- local layer = require("app.views.RubCardLayer").new( cardValue,szBack, szFont,szEnd, posX, posY, function()
    --     print("结束");
    -- end)
    -- self:addChild(layer)
end

function MainScene:onEnter()
end

function MainScene:onExit()
end

return MainScene
