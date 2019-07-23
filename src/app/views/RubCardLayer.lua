local moveVertSourceDown = 
"attribute vec2 a_position;\n"..
"attribute vec3 a_texCoord;\n"..
"uniform float ratio; \n"..
"uniform float radius; \n"..
"uniform float height;\n"..
"uniform float offx;\n"..
"uniform float offy;\n"..
"uniform float rotation;\n"..
"varying vec4 v_fragmentColor;\n"..
"varying vec2 v_texCoord;\n"..

"void main()\n"..
"{\n"..
"    vec4 tmp_pos = vec4(0.0, 0.0, 0.0, 0.0);;\n"..
"    tmp_pos = vec4(a_position.x, a_position.y, 0.0, 1.0);\n"..
"   float halfPeri = radius * 3.14159; \n"..
"   float hr = height * ratio;\n"..
"   if(hr > 0.0 && hr <= halfPeri){\n"..
"         if(tmp_pos.y < hr){\n"..
"               float rad = hr/ 3.14159;\n"..
"               float arc = (hr-tmp_pos.y)/rad;\n"..
"               tmp_pos.y = hr - sin(arc)*rad;\n"..
"               tmp_pos.z = rad * (1.0-cos(arc)); \n"..
"          }\n"..
"   }\n"..
"   if(hr > halfPeri){\n"..
"        float straight = (hr - halfPeri)/2.0;\n"..
"        if(tmp_pos.y < straight){\n"..
"            tmp_pos.y = hr  - tmp_pos.y;\n"..
"            tmp_pos.z = radius * 2.0; \n"..
"        }\n"..
"        else if(tmp_pos.y < (straight + halfPeri)) {\n"..
"            float dy = halfPeri - (tmp_pos.y - straight);\n"..
"            float arc = dy/radius;\n"..
"            tmp_pos.y = hr - straight - sin(arc)*radius;\n"..
"            tmp_pos.z = radius * (1.0-cos(arc)); \n"..
"        }\n"..
"    }\n"..
"    float y1 = tmp_pos.y;\n"..
"    float z1 = tmp_pos.z;\n"..
"    float y2 = height;\n"..
"    float z2 = 0.0;\n"..
"    float sinRat = sin(rotation);\n"..
"    float cosRat = cos(rotation);\n"..
"    tmp_pos.y=(y1-y2)*cosRat-(z1-z2)*sinRat+y2;\n"..
"    tmp_pos.z=(z1-z2)*cosRat+(y1-y2)*sinRat+z2;\n"..
"    tmp_pos.y = tmp_pos.y - height/2.0*(1.0-cosRat);\n"..
"    tmp_pos += vec4(offx, offy, 0.0, 0.0);\n"..
"    gl_Position = CC_MVPMatrix * tmp_pos;\n"..
"    v_texCoord = vec2(a_texCoord.x,a_texCoord.y);\n"..
"}\n";

-- 从上往下
local moveVertSourceUp = 
"attribute vec2 a_position;\n"..
"attribute vec3 a_texCoord;\n"..
"uniform float ratio; \n"..
"uniform float radius; \n"..
"uniform float height;\n"..
"uniform float width;\n"..
"uniform float offx;\n"..
"uniform float offy;\n"..
"uniform float rotation;\n"..
"varying vec4 v_fragmentColor;\n"..
"varying vec2 v_texCoord;\n"..

"void main()\n"..
"{\n"..
"    vec4 tmp_pos = vec4(0.0, 0.0, 0.0, 0.0);;\n"..
"    tmp_pos = vec4(a_position.x, height - a_position.y, 0.0, 1.0);\n"..

"   float halfPeri = radius * 3.14159; \n"..
"   float hr = height * ratio ;\n"..
"   if(hr > 0.0 && hr <= halfPeri){\n"..
"         if(tmp_pos.y < hr){\n"..
"               float rad = hr/ 3.14159;\n"..
"               float arc = (hr-tmp_pos.y)/rad;\n"..
"               tmp_pos.y = hr - sin(arc)*rad;\n"..
"               tmp_pos.z = rad * (1.0-cos(arc)); \n"..
"          }\n"..
"   }\n"..
"   if(hr > halfPeri){\n"..
"        float straight = (hr - halfPeri)/2.0;\n"..
"        if(tmp_pos.y < straight){\n"..
"            tmp_pos.y = hr  - tmp_pos.y;\n"..
"            tmp_pos.z = radius * 2.0; \n"..
"        }\n"..
"        else if(tmp_pos.y < (straight + halfPeri)) {\n"..
"            float dy = halfPeri - (tmp_pos.y - straight);\n"..
"            float arc = dy/radius;\n"..
"            tmp_pos.y = hr - straight - sin(arc)*radius;\n"..
"            tmp_pos.z = radius * (1.0-cos(arc)); \n"..
"        }\n"..
"    }\n"..
"    tmp_pos.y = height - tmp_pos.y;\n"..
"    float y1 = tmp_pos.y;\n"..
"    float z1 = tmp_pos.z;\n"..
"    float y2 = height;\n"..
"    float z2 = 0.0;\n"..
"    float sinRat = sin(rotation);\n"..
"    float cosRat = cos(rotation);\n"..
"    tmp_pos.y=(y1-y2)*cosRat-(z1-z2)*sinRat+y2;\n"..
"    tmp_pos.z=(z1-z2)*cosRat+(y1-y2)*sinRat+z2;\n"..
"    tmp_pos.y = tmp_pos.y - height/2.0*(1.0-cosRat);\n"..
"    tmp_pos += vec4(offx, offy, 0.0, 0.0);\n"..
"    gl_Position = CC_MVPMatrix * tmp_pos;\n"..
"    v_texCoord = vec2(a_texCoord.x,a_texCoord.y);\n"..
"}\n";


local moveVertSourceLeft = 
"attribute vec2 a_position;\n"..
"attribute vec3 a_texCoord;\n"..
"uniform float ratio; \n"..
"uniform float radius; \n"..
"uniform float height;\n"..
"uniform float width;\n"..
"uniform float offx;\n"..
"uniform float offy;\n"..
"uniform float rotation;\n"..
"varying vec4 v_fragmentColor;\n"..
"varying vec2 v_texCoord;\n"..

"void main()\n"..
"{\n"..
"    vec4 tmp_pos = vec4(0.0, 0.0, 0.0, 0.0);;\n"..
"    tmp_pos = vec4(a_position.x, a_position.y, 0.0, 1.0);\n"..

"   float halfPeri = radius * 3.14159; \n"..
"   float hr = width * ratio;\n"..
"   if(hr > 0.0 && hr <= halfPeri){\n"..
"         if(tmp_pos.x < hr){\n"..
"               float rad = hr/ 3.14159;\n"..
"               float arc = (hr-tmp_pos.x)/rad;\n"..
"               tmp_pos.x = hr - sin(arc)*rad;\n"..
"               tmp_pos.z = rad * (1.0-cos(arc)); \n"..
"          }\n"..
"   }\n"..
"   if(hr > halfPeri){\n"..
"        float straight = (hr - halfPeri)/2.0;\n"..
"        if(tmp_pos.x < straight){\n"..
"            tmp_pos.x = hr  - tmp_pos.x;\n"..
"            tmp_pos.z = radius * 2.0; \n"..
"        }\n"..
"        else if(tmp_pos.x < (straight + halfPeri)) {\n"..
"            float dy = halfPeri - (tmp_pos.x - straight);\n"..
"            float arc = dy/radius;\n"..
"            tmp_pos.x = hr - straight - sin(arc)*radius;\n"..
"            tmp_pos.z = radius * (1.0-cos(arc)); \n"..
"        }\n"..
"    }\n"..
"    float y1 = tmp_pos.x;\n"..
"    float z1 = tmp_pos.z;\n"..
"    float y2 = width;\n"..
"    float z2 = 0.0;\n"..
"    float sinRat = sin(rotation);\n"..
"    float cosRat = cos(rotation);\n"..
"    tmp_pos.x=(y1-y2)*cosRat-(z1-z2)*sinRat+y2;\n"..
"    tmp_pos.z=(z1-z2)*cosRat+(y1-y2)*sinRat+z2;\n"..
"    tmp_pos.x = tmp_pos.x - width/2.0*(1.0-cosRat);\n"..
"    tmp_pos += vec4(offx, offy, 0.0, 0.0);\n"..
"    gl_Position = CC_MVPMatrix * tmp_pos;\n"..
"    v_texCoord = vec2(a_texCoord.x,a_texCoord.y);\n"..
"}\n";

local moveVertSourceRight = 
"attribute vec2 a_position;\n"..
"attribute vec3 a_texCoord;\n"..
"uniform float ratio; \n"..
"uniform float radius; \n"..
"uniform float height;\n"..
"uniform float width;\n"..
"uniform float offx;\n"..
"uniform float offy;\n"..
"uniform float rotation;\n"..
"varying vec4 v_fragmentColor;\n"..
"varying vec2 v_texCoord;\n"..

"void main()\n"..
"{\n"..
"    vec4 tmp_pos = vec4(0.0, 0.0, 0.0, 0.0);;\n"..
"    tmp_pos = vec4(width - a_position.x, a_position.y, 0.0, 1.0);\n"..

"   float halfPeri = radius * 3.14159; \n"..
"   float hr = width * ratio;\n"..
"   if(hr > 0.0 && hr <= halfPeri){\n"..
"         if(tmp_pos.x < hr){\n"..
"               float rad = hr/ 3.14159;\n"..
"               float arc = (hr-tmp_pos.x)/rad;\n"..
"               tmp_pos.x = hr - sin(arc)*rad;\n"..
"               tmp_pos.z = rad * (1.0-cos(arc)); \n"..
"          }\n"..
"   }\n"..
"   if(hr > halfPeri){\n"..
"        float straight = (hr - halfPeri)/2.0;\n"..
"        if(tmp_pos.x < straight){\n"..
"            tmp_pos.x = hr  - tmp_pos.x;\n"..
"            tmp_pos.z = radius * 2.0; \n"..
"        }\n"..
"        else if(tmp_pos.x < (straight + halfPeri)) {\n"..
"            float dy = halfPeri - (tmp_pos.x - straight);\n"..
"            float arc = dy/radius;\n"..
"            tmp_pos.x = hr - straight - sin(arc)*radius;\n"..
"            tmp_pos.z = radius * (1.0-cos(arc)); \n"..
"        }\n"..
"    }\n"..
"   tmp_pos.x = width -tmp_pos.x;\n"..
"    float y1 = tmp_pos.x;\n"..
"    float z1 = tmp_pos.z;\n"..
"    float y2 = width;\n"..
"    float z2 = 0.0;\n"..
"    float sinRat = sin(rotation);\n"..
"    float cosRat = cos(rotation);\n"..
"    tmp_pos.x=(y1-y2)*cosRat-(z1-z2)*sinRat+y2;\n"..
"    tmp_pos.z=(z1-z2)*cosRat+(y1-y2)*sinRat+z2;\n"..
"    tmp_pos.x = tmp_pos.x - width/2.0*(1.0-cosRat);\n"..
"    tmp_pos += vec4(offx, offy, 0.0, 0.0);\n"..
"    gl_Position = CC_MVPMatrix * tmp_pos;\n"..
"    v_texCoord = vec2(a_texCoord.x,a_texCoord.y);\n"..
"}\n";


local smoothVertSource = 
"attribute vec2 a_position;\n"..
"attribute vec3 a_texCoord;\n"..
"uniform float height;\n"..
"uniform float width;\n"..
"uniform float offx;\n"..
"uniform float offy;\n"..
"uniform float rotation;\n"..
"varying vec2 v_texCoord;\n"..

"void main()\n"..
"{\n"..
"    vec4 tmp_pos = vec4(0.0, 0.0, 0.0, 0.0);;\n"..
"    tmp_pos = vec4(a_position.x,height - a_position.y, 0.0, 1.0);\n"..
"    float cl = height/5.0;\n"..
"    float sl = (height - cl)/2.0;\n"..
"    float radii = (cl/rotation)/2.0;\n"..
"    float sinRot = sin(rotation);\n"..
"    float cosRot = cos(rotation);\n"..
"    float distance = radii*sinRot;\n"..
"    float centerY = height/2.0;\n"..
"    float poxY1 = centerY - distance;\n"..
"    float poxY2 = centerY + distance;\n"..
"    float posZ = sl*sinRot;\n"..
"    if(tmp_pos.y <= sl){\n"..
"       float length = sl - tmp_pos.y;\n"..
"       tmp_pos.y = poxY1 - length*cosRot;\n"..
"       tmp_pos.z = posZ - length*sinRot;\n"..
"    }\n"..
"    else if(tmp_pos.y < (sl+cl)){\n"..
"       float el = tmp_pos.y - sl;\n"..
"       float rotation2 = -el/radii;\n"..
"       float x1 = poxY1;\n"..
"       float y1 = posZ;\n"..
"       float x2 = centerY;\n"..
"       float y2 = posZ - radii*cosRot;\n"..
"       float sinRot2 = sin(rotation2);\n"..
"       float cosRot2 = cos(rotation2);\n"..
"       tmp_pos.y=(x1-x2)*cosRot2-(y1-y2)*sinRot2+x2;\n"..
"       tmp_pos.z=(y1-y2)*cosRot2+(x1-x2)*sinRot2+y2;\n"..
"    }\n"..
"    else if(tmp_pos.y <= height){\n"..
"        float length = tmp_pos.y - cl - sl;\n"..
"        tmp_pos.y = poxY2 + length*cosRot;\n"..
"        tmp_pos.z = posZ - length*sinRot;\n"..
"    }\n"..
"    tmp_pos.y = height - tmp_pos.y;\n"..
"    tmp_pos += vec4(offx, offy, 0.0, 0.0);\n"..
"    gl_Position = CC_MVPMatrix * tmp_pos;\n"..
"    v_texCoord = vec2(a_texCoord.z, a_texCoord.y);\n"..
"}\n"

local smoothVertSourceLR = 
"attribute vec2 a_position;\n"..
"attribute vec3 a_texCoord;\n"..
"uniform float height;\n"..
"uniform float width;\n"..
"uniform float offx;\n"..
"uniform float offy;\n"..
"uniform float rotation;\n"..
"varying vec2 v_texCoord;\n"..

"void main()\n"..
"{\n"..
"    vec4 tmp_pos = vec4(0.0, 0.0, 0.0, 0.0);;\n"..
"    tmp_pos = vec4(width - a_position.x, height - a_position.y, 0.0, 1.0);\n"..
"    float cl = width/5.0;\n"..
"    float sl = (width - cl)/2.0;\n"..
"    float radii = (cl/rotation)/2.0;\n"..
"    float sinRot = sin(rotation);\n"..
"    float cosRot = cos(rotation);\n"..
"    float distance = radii*sinRot;\n"..
"    float centerY = width/2.0;\n"..
"    float poxY1 = centerY - distance;\n"..
"    float poxY2 = centerY + distance;\n"..
"    float posZ = sl*sinRot;\n"..
"    if(tmp_pos.x <= sl){\n"..
"       float length = sl - tmp_pos.x;\n"..
"       tmp_pos.x = poxY1 - length*cosRot;\n"..
"       tmp_pos.z = posZ - length*sinRot;\n"..
"    }\n"..
"    else if(tmp_pos.x < (sl+cl)){\n"..
"       float el = tmp_pos.x - sl;\n"..
"       float rotation2 = -el/radii;\n"..
"       float x1 = poxY1;\n"..
"       float y1 = posZ;\n"..
"       float x2 = centerY;\n"..
"       float y2 = posZ - radii*cosRot;\n"..
"       float sinRot2 = sin(rotation2);\n"..
"       float cosRot2 = cos(rotation2);\n"..
"       tmp_pos.x=(x1-x2)*cosRot2-(y1-y2)*sinRot2+x2;\n"..
"       tmp_pos.z=(y1-y2)*cosRot2+(x1-x2)*sinRot2+y2;\n"..
"    }\n"..
"    else if(tmp_pos.x <= width){\n"..
"        float length = tmp_pos.x - cl - sl;\n"..
"        tmp_pos.x = poxY2 + length*cosRot;\n"..
"        tmp_pos.z = posZ - length*sinRot;\n"..
"    }\n"..
-- "    tmp_pos.x = width - tmp_pos.x;\n"..
"    tmp_pos += vec4(offx, offy, 0.0, 0.0);\n"..
"    gl_Position = CC_MVPMatrix * tmp_pos;\n"..
"    v_texCoord = vec2(a_texCoord.z, a_texCoord.y);\n"..
"}\n"


local endVertSource = 
"attribute vec2 a_position;\n"..
"attribute vec3 a_texCoord;\n"..
"uniform float offx;\n"..
"uniform float offy;\n"..
"varying vec2 v_texCoord;\n"..
"uniform float height;\n"..
"uniform float width;\n"..

"void main()\n"..
"{\n"..
"    vec4 tmp_pos = vec4(0.0, 0.0, 0.0, 0.0);;\n"..
"    tmp_pos = vec4(a_position.x,a_position.y, 0.0, 1.0);\n"..
"    tmp_pos += vec4(offx, offy, 0.0, 0.0);\n"..
"    gl_Position = CC_MVPMatrix * tmp_pos;\n"..
"    v_texCoord = vec2(a_texCoord.z, a_texCoord.y);\n"..
"}\n"

local endVertSourceLR = 
"attribute vec2 a_position;\n"..
"attribute vec3 a_texCoord;\n"..
"uniform float offx;\n"..
"uniform float offy;\n"..
"varying vec2 v_texCoord;\n"..
"uniform float height;\n"..
"uniform float width;\n"..

"void main()\n"..
"{\n"..
"    vec4 tmp_pos = vec4(0.0, 0.0, 0.0, 0.0);;\n"..
"    tmp_pos = vec4( width - a_position.x, height - a_position.y, 0.0, 1.0);\n"..
-- "    tmp_pos.y = height - tmp_pos.y;\n"..
"    tmp_pos += vec4(offx, offy, 0.0, 0.0);\n"..
"    gl_Position = CC_MVPMatrix * tmp_pos;\n"..
"    v_texCoord = vec2(a_texCoord.z, a_texCoord.y);\n"..
"}\n"

local strFragSource =
"varying vec2 v_texCoord;\n"..
"void main()\n"..
"{\n"..
    "//TODO, 这里可以做些片段着色特效\n"..
    "gl_FragColor = texture2D(CC_Texture0, v_texCoord);\n"..
"}\n"

local direction = {
    up = 1,
    down = 2,
    left = 3,
    right = 4,
}

local RubCardLayer_Pai = 3.141592
local RubCardLayer_State_Move = 1
local RubCardLayer_State_Smooth = 2
local RubCardLayer_RotationFrame = 6
local RubCardLayer_RotationAnger = RubCardLayer_Pai/3
local RubCardLayer_SmoothFrame = 6
local RubCardLayer_SmoothAnger = RubCardLayer_Pai/6

local RubCardLayer = {}

local RubCardLayer = class("RubCardLayer", function()
        local node = display.newLayer()
        return node
end)



function RubCardLayer:ctor(cardValue,szBack, szFont,szEnd, posX, posY, endCallBack)

    self:__init(cardValue,szBack, szFont, szEnd,posX, posY, endCallBack)
   
end

function RubCardLayer:loadPBalyer(name,zoder)
    local layer = name and self:getChildByName(name) or nil
    if layer then
        return
    end

    layer = cc.Layer:create()
    if name then
        layer:setName(name)
    end
    self:addChild(layer,zoder or -1)
    local function touchBegin(touch, event)
        return true
    end
    local function touchMove(touch, event)
        return true
    end
    local function touchEnd(touch, event)
        if name == "remove" then
            print("111111")
            local parent = self:getParent()
            if not parent then
                return
            end
            parent:removeSelf()
            -- self:endfunc()
            -- if parent.callback then
            --     parent.callback()
            -- end 
            -- local scene = cc.Director:getInstance():getRunningScene()
            -- if scene then
            --     scene:removeChildByName("rub_num")
            -- end
            -- local parent = self:getParent()
            -- if  parent then
            --     parent:removeFromParent()
            -- end
        end

        return true
    end

    local listener = cc.EventListenerTouchOneByOne:create()
    listener:setSwallowTouches(true)
    listener:registerScriptHandler(touchBegin, cc.Handler.EVENT_TOUCH_BEGAN )
    listener:registerScriptHandler(touchMove, cc.Handler.EVENT_TOUCH_MOVED )
    listener:registerScriptHandler(touchEnd, cc.Handler.EVENT_TOUCH_ENDED )
    local eventDispatcher = layer:getEventDispatcher()
    eventDispatcher:addEventListenerWithSceneGraphPriority(listener, layer)
end

function RubCardLayer:__init(cardValue,szBack, szFont,szEnd, posX, posY, endCallBack)
    self:loadPBalyer()
        
    -- self:setContenSzie(1280,720)
    self.IsShow = false
    self.cardValue = cardValue
    self.posX = posX
    self.posY = posY
    self.backFrameSprite = szBack
    self.frontFrameSprite = szFont
    self.endFrameSprite = szEnd
    self.endCallBack = endCallBack
    local scale = 1
    self.scale = scale

    local glNode = gl.glNodeCreate()
    self.glNode = glNode
    self:addChild(glNode)

    -- 从下向上
    local moveGlProgramDown = cc.GLProgram:createWithByteArrays(moveVertSourceDown, strFragSource)
    self.moveGlProgramDown = moveGlProgramDown
    moveGlProgramDown:retain()
    moveGlProgramDown:updateUniforms()

    -- 从上向下
    local moveGlProgramUp = cc.GLProgram:createWithByteArrays(moveVertSourceUp, strFragSource)
    self.moveGlProgramUp = moveGlProgramUp
    moveGlProgramUp:retain()
    moveGlProgramUp:updateUniforms()

     -- 从右向左
    local moveGlProgramRight = cc.GLProgram:createWithByteArrays(moveVertSourceRight, strFragSource)
    self.moveGlProgramRight = moveGlProgramRight
    moveGlProgramRight:retain()
    moveGlProgramRight:updateUniforms()

     -- 从左向右
    local moveGlProgramLeft = cc.GLProgram:createWithByteArrays(moveVertSourceLeft, strFragSource)
    self.moveGlProgramLeft = moveGlProgramLeft
    moveGlProgramLeft:retain()
    moveGlProgramLeft:updateUniforms()    


    local smoothGlProgram = cc.GLProgram:createWithByteArrays(smoothVertSource, strFragSource)
    self.smoothGlProgram = smoothGlProgram
    smoothGlProgram:retain()
    smoothGlProgram:updateUniforms()

    local smoothGlProgramLR = cc.GLProgram:createWithByteArrays(smoothVertSourceLR, strFragSource)
    self.smoothGlProgramLR = smoothGlProgramLR
    smoothGlProgramLR:retain()
    smoothGlProgramLR:updateUniforms()

    local endGlProgram = cc.GLProgram:createWithByteArrays(endVertSource, strFragSource)
    self.endGlProgram = endGlProgram
    endGlProgram:retain()
    endGlProgram:updateUniforms()

    local endGlProgramLR = cc.GLProgram:createWithByteArrays(endVertSourceLR, strFragSource)
    self.endGlProgramLR = endGlProgramLR
    endGlProgramLR:retain()
    endGlProgramLR:updateUniforms()
    -- self:__createLb()
    self:__registerTouchEvent()

    self.state = RubCardLayer_State_Move

    self:createSprites()

    local sz1 = {self.pokerWidth,self.pokerHeight}
    self.sz1 = sz1
    local msh1, nVerts1 = self:__initCardVertex(cc.size(sz1[1] * scale, sz1[2] * scale), texRange1, true)

    local msh2, nVerts2 = self:__initCardVertex(cc.size(sz1[1] * scale, sz1[2] * scale), texRange2, false)

    self.ratioVal = 0
    self.radiusVal = sz1[2]*scale/10;

    self.pokerHeight = sz1[2] * scale

    self.offx = self.posX - self.sz1[1]/2*self.scale
    self.offy = self.posY - self.sz1[2]/2*self.scale
    --牌的渲染信息 (上下)
    local cardMesh = {{id1, msh1, nVerts1},{id2, msh2, nVerts2} }
    self.cardMesh = cardMesh

    local msh1, nVerts1 = self:__initCardVertex_lr(cc.size(sz1[1] * scale, sz1[2] * scale), texRange1, true)

    local msh2, nVerts2 = self:__initCardVertex_lr(cc.size(sz1[1] * scale, sz1[2] * scale), texRange2, false)
     --牌的渲染信息(左右) 
    local cardMesh = {{id1, msh1, nVerts1},{id2, msh2, nVerts2} }
    self.cardMesh_lf = cardMesh

    -- OpenGL绘制函数
    local function draw(transform, transformUpdated)
        if self.state == RubCardLayer_State_Move then
			self:__drawByMoveProgram(0)
			print("RubCardLayer_State_Move")
		elseif self.state == RubCardLayer_State_Smooth then
			print("RubCardLayer_State_Smooth",self.smoothFrame)
            if self.smoothFrame == nil then
                self.smoothFrame = 1
            end
            if self.smoothFrame <= RubCardLayer_RotationFrame then
                local rotation = -RubCardLayer_RotationAnger*self.smoothFrame/RubCardLayer_RotationFrame
                if direction.up == self.direction or direction.right == self.direction then
                    rotation = 0 - rotation
                end

                self:__drawByMoveProgram(rotation,false)
            elseif self.smoothFrame < (RubCardLayer_RotationFrame+RubCardLayer_SmoothFrame) then
                local scale = (self.smoothFrame - RubCardLayer_RotationFrame)/RubCardLayer_SmoothFrame
                self:__drawBySmoothProgram(math.max(0.01,RubCardLayer_SmoothAnger*(1-scale)),false)
            else
                
                self:__drawByEndProgram()
                self:showCardVaue()
            end
            self.smoothFrame = self.smoothFrame + 1
        end
    end
    glNode:registerScriptDrawHandler(draw)

    
end

function RubCardLayer:createSprites()
    local backSprite = self.backFrameSprite;

    local pokerSize = backSprite:getContentSize();
    self.pokerWidth = pokerSize.height
    self.pokerHeight = pokerSize.width

    self.backTexId = backSprite:getTexture():getName()
    
    local frontFrameSprite = self.frontFrameSprite;--cc.SpriteFrameCache:getInstance():getSpriteFrame(self.szFont);
    frontFrameSprite:setVisible(false)

    self.frontTexId = frontFrameSprite:getTexture():getName()

    local endFrameSprite = self.endFrameSprite
    endFrameSprite:setVisible(false)
    self.endTexId = endFrameSprite:getTexture():getName()

end

function RubCardLayer:remove()
    local function callBack()
        self:removeFromParent()
    end
    local callFunc = cc.CallFunc:create(callBack)
    local delay = cc.DelayTime:create(0.01)
    local sequence = cc.Sequence:create(delay, callFunc)
    self:runAction(cc.RepeatForever:create(sequence))
end

function RubCardLayer:__createLb()
    -- local label = cc.Sprite:createWithSpriteFrameName()--"blink_horizontal_1.png"
 --    --local label = cc.Label:createWithTTF("test", "fonts/arial.ttf", 32)
 --    self:addChild(label, 2)
    -- label:setAnchorPoint(cc.p(0.5, 0.5))
    -- label:setOpacity(0)
    -- label:setPosition( 0,0)
end

function RubCardLayer:__drawByMoveProgram(rotation,showend)
	
	print("self.state="..self.state)
    print("self.ratioVal="..self.ratioVal)
    print("self.radiusVal="..self.radiusVal)
    print(rotation);

    local cardMesh = self.cardMesh

    local glProgram = self.moveGlProgramDown
    if self.direction == direction.up then
        glProgram = self.moveGlProgramUp
    elseif self.direction == direction.down then
        glProgram = self.moveGlProgramDown
    elseif self.direction == direction.left then
        cardMesh = self.cardMesh_lf
        glProgram = self.moveGlProgramLeft
    elseif self.direction == direction.right then
        cardMesh = self.cardMesh_lf
        glProgram = self.moveGlProgramRight
    end


    gl.enable(gl.CULL_FACE)
    glProgram:use()
    glProgram:setUniformsForBuiltins()

    for index, v in ipairs(cardMesh) do 
        if index == 1 then
            gl._bindTexture(gl.TEXTURE_2D, self.backTexId)
        else
            if showend then
                gl._bindTexture(gl.TEXTURE_2D, self.endTexId)
            else
                gl._bindTexture(gl.TEXTURE_2D, self.frontTexId)
            end

        end
        local rotationLc = gl.getUniformLocation(glProgram:getProgram(), "rotation")
        glProgram:setUniformLocationF32(rotationLc, rotation)
        local ratio = gl.getUniformLocation(glProgram:getProgram(), "ratio")
        glProgram:setUniformLocationF32(ratio, self.ratioVal)
       
        local radius = gl.getUniformLocation(glProgram:getProgram(), "radius")
		glProgram:setUniformLocationF32(radius, self.radiusVal)
		
        local offx = gl.getUniformLocation(glProgram:getProgram(), "offx")
        glProgram:setUniformLocationF32(offx, self.offx)
        local offy = gl.getUniformLocation(glProgram:getProgram(), "offy")
        glProgram:setUniformLocationF32(offy, self.offy)
        local height = gl.getUniformLocation(glProgram:getProgram(), "height")
        glProgram:setUniformLocationF32(height, self.sz1[2]*self.scale)
        local width = gl.getUniformLocation(glProgram:getProgram(), "width")
        glProgram:setUniformLocationF32(width, self.sz1[1]*self.scale)
        self:__drawArrays(v)
    end

    gl.disable(gl.CULL_FACE)
end

function RubCardLayer:__drawBySmoothProgram(rotation,showcard)
    local glProgram = self.smoothGlProgram

    if direction.left == self.direction or direction.right == self.direction then
        glProgram = self.smoothGlProgramLR
    end

    glProgram:use()
    glProgram:setUniformsForBuiltins()

    local v = self.cardMesh[2]
    if showcard then
        gl._bindTexture(gl.TEXTURE_2D, self.endTexId)
    else
        gl._bindTexture(gl.TEXTURE_2D, self.frontTexId)
    end
    -- gl._bindTexture(gl.TEXTURE_2D, self.frontTexId)
    local rotationLc = gl.getUniformLocation(glProgram:getProgram(), "rotation")
    glProgram:setUniformLocationF32(rotationLc, rotation)
    local offx = gl.getUniformLocation(glProgram:getProgram(), "offx")
    glProgram:setUniformLocationF32(offx, self.offx)
    local offy = gl.getUniformLocation(glProgram:getProgram(), "offy")
    glProgram:setUniformLocationF32(offy, self.offy)
    local height = gl.getUniformLocation(glProgram:getProgram(), "height")
    glProgram:setUniformLocationF32(height, self.sz1[2]*self.scale)
    local height = gl.getUniformLocation(glProgram:getProgram(), "width")
    glProgram:setUniformLocationF32(height, self.sz1[1]*self.scale)
    self:__drawArrays(v)
end

function RubCardLayer:__drawByEndProgram()
    -- self.endFrameSprite:setVisible(true)

    local glProgram = self.endGlProgram

    if direction.left == self.direction or direction.right == self.direction then
        glProgram = self.endGlProgramLR
    end

    glProgram:use()
    glProgram:setUniformsForBuiltins()
    local v = self.cardMesh[2]
    gl._bindTexture(gl.TEXTURE_2D, self.endTexId)--self.endTexId
    local offx = gl.getUniformLocation(glProgram:getProgram(), "offx")
    glProgram:setUniformLocationF32(offx, self.offx)
    local offy = gl.getUniformLocation(glProgram:getProgram(), "offy")
    glProgram:setUniformLocationF32(offy, self.offy)
    local height = gl.getUniformLocation(glProgram:getProgram(), "height")
    glProgram:setUniformLocationF32(height, self.sz1[2]*self.scale)
    local height = gl.getUniformLocation(glProgram:getProgram(), "width")
    glProgram:setUniformLocationF32(height, self.sz1[1]*self.scale)
    self:__drawArrays(v)
end

function RubCardLayer:showCardVaue( )

    if self.IsShow then return end
	self.IsShow = true
	self.endCallBack()
    -- local layer = cc.CSLoader:createNode("niuniu/csd_nn_rubcard_num.csb")
    -- for i=1,2 do
    --     local numNode = layer:getChildByName("Node_Num_"..i)
    --     numNode:setOpacity(0)
    --     local Sprite_Hua = numNode:getChildByName("Sprite_Hua")
    --     Sprite_Hua:setTexture(string.format("niuniu/rubcard/%s.png",self.cardValue.small))
    --     local Sprite_Num = numNode:getChildByName("Sprite_Num")
    --     Sprite_Num:setTexture(string.format("niuniu/rubcard/%s.png",self.cardValue.num))
        
    --     numNode:runAction(cc.Sequence:create(
    --         cc.FadeIn:create(0.5),
    --         cc.CallFunc:create(function() 
    --                 if i == 2 and self.endCallBack then
    --                     self.endCallBack()
    --                     self.endCallBack = nil
    --                 end
    --             end)
    --         ))
    -- end
    -- local scene = cc.Director:getInstance():getRunningScene()
    -- layer:setAnchorPoint(0.5,0.5)
    -- layer:setName("rub_num")
    -- layer:setRotation(-90)
    -- layer:setPosition(self.posX,self.posY)
    -- if scene then
    --     scene:addChild(layer,1000)
    -- end
    self:loadPBalyer("remove",100)

end

function RubCardLayer:__drawArrays(v)
    gl.glEnableVertexAttribs(bit._or(cc.VERTEX_ATTRIB_FLAG_TEX_COORDS, cc.VERTEX_ATTRIB_FLAG_POSITION))
    gl.bindBuffer(gl.ARRAY_BUFFER, v[2][1])
    gl.vertexAttribPointer(cc.VERTEX_ATTRIB_POSITION,2,gl.FLOAT,false,0,0)
    gl.bindBuffer(gl.ARRAY_BUFFER, v[2][2])
    gl.vertexAttribPointer(cc.VERTEX_ATTRIB_TEX_COORD,3,gl.FLOAT,false,0,0)
    gl.drawArrays(gl.TRIANGLES, 0, self.vertsNum)
    gl.bindBuffer(gl.ARRAY_BUFFER, 0)
end

function RubCardLayer:__registerTouchEvent()
    local function onNodeEvent(event)
        if "exit" == event then
            gl._deleteBuffer(self.cardMesh[1][2][1].buffer_id)
            gl._deleteBuffer(self.cardMesh[1][2][2].buffer_id)
            gl._deleteBuffer(self.cardMesh[2][2][1].buffer_id)
            gl._deleteBuffer(self.cardMesh[2][2][2].buffer_id)
            self.moveGlProgramDown:release()
            self.moveGlProgramUp:release()
            self.moveGlProgramRight:release()
            self.moveGlProgramLeft:release()
            self.smoothGlProgram:release()
            self.smoothGlProgramLR:release()
            self.endGlProgramLR:release()
            self.endGlProgram:release()
            --self.backSprite:release()
            --self.frontSprite:release()
            self:stopAllActions()

            -- if self.schedulerID~=nil then
            --     cc.Director:getInstance():getScheduler():unscheduleScriptEntry(self.schedulerID)
            --     self.schedulerID=nil
            -- end
        end
    end
    self:registerScriptHandler(onNodeEvent)

    local touchBeginPos = nil
    self.direction = nil

    local function countDirection(beginPos,movePos)
        if self.direction then
            return true
        end
        -- 点击区域范围
        local size = {width=self.pokerWidth,height=self.pokerHeight}
        size.width = size.width * 1.4
        size.height = size.height * 1.3

        -- 上下,左右
        local X,Y = self.posX,self.posY 

        -- xy的偏移度
        local offx = math.abs(beginPos.x - movePos.x)
        local offy = math.abs(beginPos.y - movePos.y)

        if offx - offy > 5 then
            if beginPos.x > self.posX then
            -- 点击区域在右部分
                self.direction = direction.right
            elseif beginPos.x <= self.posX then 
            -- 点击区域在左部分
                self.direction = direction.left
            end
        elseif offx - offy < -5 then 
             if beginPos.y > self.posY then
            -- 点击区域在上部分
                self.direction = direction.up
            elseif beginPos.y <= self.posY then 
            -- 点击区域在下部分
                self.direction = direction.down
            end
        else
            self.direction = nil
            return false
        end
        return true
    end


    local function touchBegin(touch, event)
        local point = touch:getLocation()
        point = self:convertToNodeSpace(point)
        if not touchBeginPos then
            touchBeginPos = point
        else 
            return false
        end
        self.direction = nil
        return true
    end
    local function touchMove(touch, event)

          -- 是否点击在区域内
        local size = {width=self.pokerWidth,height=self.pokerHeight}
        size.width = size.width * 1.4
        size.height = size.height * 1.3

        if self.posX - size.width/2 <= touchBeginPos.x and self.posX + size.width/2 >= touchBeginPos.x and
            self.posY - size.height/2 <= touchBeginPos.y and self.posY + size.height/2 >= touchBeginPos.y then

            self:stopAllActions()

            -- if self.schedulerID~=nil then
            --     cc.Director:getInstance():getScheduler():unscheduleScriptEntry(self.schedulerID)
            --     self.schedulerID=nil
            -- end

            local location = touch:getLocation()
        
            countDirection(touchBeginPos,self:convertToNodeSpace(location))

            if not self.direction then
                return
            end

            if self.direction == direction.up or self.direction == direction.down then
                self.ratioVal = (location.y-self.offy)/self.pokerHeight
                self.ratioVal = math.max(0, self.ratioVal)
                self.ratioVal = math.min(1, self.ratioVal)

                if self.direction == direction.up then
                    self.ratioVal = 1-self.ratioVal
                end

            else
                self.ratioVal = (location.x-self.offx)/self.pokerWidth
                self.ratioVal = math.max(0, self.ratioVal)
                self.ratioVal = math.min(1, self.ratioVal)

                if self.direction == direction.right then

                    self.ratioVal = 1.0 - self.ratioVal
                end
            end
        end
        return true
    end
    local function touchEnd(touch, event)
        touchBeginPos = nil
      
        if self.ratioVal >= 0.8 then
            self:endfunc()
            self.state = RubCardLayer_State_Smooth
            self:loadPBalyer("layer",100)
        else

            self:runAction(cc.RepeatForever:create( cc.Sequence:create(
                cc.CallFunc:create(function ( )
                     self.ratioVal = self.ratioVal - 0.1
                    if self.ratioVal < 0 then
                        self.ratioVal = 0
                    end
                    if self.ratioVal == 0 then
                        self:endfunc()
                    end
                end),
                cc.DelayTime:create(0.02)
            )))
            -- self.schedulerID = cc.Director:getInstance():getScheduler():scheduleScriptFunc(handler(self,function(dt)
               
            -- end),0.02,false)
        end
        return transformUpdated
    end
    local listener = cc.EventListenerTouchOneByOne:create()
    listener:setSwallowTouches(true)
    listener:registerScriptHandler(touchBegin, cc.Handler.EVENT_TOUCH_BEGAN )
    listener:registerScriptHandler(touchMove, cc.Handler.EVENT_TOUCH_MOVED )
    listener:registerScriptHandler(touchEnd, cc.Handler.EVENT_TOUCH_ENDED )
    local eventDispatcher = self:getEventDispatcher()
    eventDispatcher:addEventListenerWithSceneGraphPriority(listener, self)
end

-- 结束时调用
function RubCardLayer:endfunc()
    
    self:stopAllActions()
    -- if self.schedulerID~=nil then
    --     cc.Director:getInstance():getScheduler():unscheduleScriptEntry(self.schedulerID)
    -- end
    -- self.schedulerID=nil
end

function RubCardLayer:__initCardVertex(size, texRange, isBack)
    local frameSprite = self.frontFrameSprite;
    if isBack then
        frameSprite = self.backFrameSprite
    end
    local s = frameSprite:getContentSize();
    local p = {x=frameSprite:getPositionX(),y=frameSprite:getPositionY()};
    local ap = frameSprite:getAnchorPoint();

    local allSize = frameSprite:getContentSize()
    local allWidth = allSize.width
    local allHeight = allSize.height

    local rect = cc.rect(0,0,allSize.width,allSize.height)

    local nDiv = 20 --将宽分成100份
    
    local verts = {} --位置坐标
    local texs = {} --纹理坐标
    local dh = size.height/nDiv
    local dw = size.width

    --计算顶点位置
    for c = 1, nDiv do 
        local x, y = 0, (c-1)*dh
        local quad = {}
        if isBack then
            quad = {x, y, x+dw, y, x, y+dh, x+dw, y, x+dw, y+dh, x, y+dh}
        else
            quad = {x, y, x, y+dh, x+dw, y, x+dw, y, x, y+dh, x+dw, y+dh}
        end
        for i=1,6 do
            local quadX = quad[i*2-1]
            local quadY = quad[i*2]
            local numX = (rect.x+self.pokerHeight-quadY)/allWidth
            local numY = (rect.y+quadX)/allHeight
            local numX2 = (rect.x+quadY)/allWidth
            table.insert(texs, math.max(0,numX));
            table.insert(texs, math.max(0,numY));
            table.insert(texs, math.max(0,numX2));
        end
        for _, v in ipairs(quad) do table.insert(verts, v) end
    end

    local res = {}
    local tmp = {verts, texs}
    for _, v in ipairs(tmp) do 
        local buffid = gl.createBuffer()
        gl.bindBuffer(gl.ARRAY_BUFFER, buffid)
        gl.bufferData(gl.ARRAY_BUFFER, table.getn(v), v, gl.STATIC_DRAW)
        gl.bindBuffer(gl.ARRAY_BUFFER, 0)
        table.insert(res, buffid)
    end
    self.vertsNum = #verts
    return res, #verts
end


-- 计算左右
function RubCardLayer:__initCardVertex_lr(size, texRange, isBack)
    local frameSprite = self.frontFrameSprite;
    if isBack then
        frameSprite = self.backFrameSprite
    end
    local s = frameSprite:getContentSize();
    local p = {x=frameSprite:getPositionX(),y=frameSprite:getPositionY()};
    local ap = frameSprite:getAnchorPoint();

    local allSize = frameSprite:getContentSize()
    local allWidth = allSize.width
    local allHeight = allSize.height

    local rect = cc.rect(0,0,allSize.width,allSize.height)

    local nDiv = 20 --将宽分成100份
    
    local verts = {} --位置坐标
    local texs = {} --纹理坐标
    local dh = size.height
    local dw = size.width/nDiv

    --计算顶点位置
    for c = 1, nDiv do 
        local x, y = (c-1)*dw, 0
        local quad = {}
        if isBack then
            quad = {x, y, x+dw, y, x, y+dh, x+dw, y, x+dw, y+dh, x, y+dh}
        else
            quad = {x, y, x, y+dh, x+dw, y, x+dw, y, x, y+dh, x+dw, y+dh}
        end
        
        for i=1,6 do
            local quadX = quad[i*2-1]
            local quadY = quad[i*2]
            local numX = (rect.x+self.pokerHeight-quadY)/allWidth
            local numY = (rect.y+quadX)/allHeight
            local numX2 = (rect.x+quadY)/allWidth
            table.insert(texs, math.max(0,numX));
            table.insert(texs, math.max(0,numY));
            table.insert(texs, math.max(0,numX2));
        end
        for _, v in ipairs(quad) do table.insert(verts, v) end
    end

    local res = {}
    local tmp = {verts, texs}
    for _, v in ipairs(tmp) do 
        local buffid = gl.createBuffer()
        gl.bindBuffer(gl.ARRAY_BUFFER, buffid)
        gl.bufferData(gl.ARRAY_BUFFER, table.getn(v), v, gl.STATIC_DRAW)
        gl.bindBuffer(gl.ARRAY_BUFFER, 0)
        table.insert(res, buffid)
    end
    self.vertsNum = #verts
    return res, #verts
end
return RubCardLayer
