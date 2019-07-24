--
-- Author: Your Name
-- Date: 2019-05-21 21:42:48
--

local shaders = {}

-- 顶点 shader
local vertex = [[
    attribute vec4 a_position;
    attribute vec2 a_texCoord;
    attribute vec4 a_color;

    #ifdef GL_ES
        varying lowp vec4 v_fragmentColor;
        varying mediump vec2 v_texCoord;
    #else
        varying vec4 v_fragmentColor;
        varying vec2 v_texCoord;
    #endif

    void main()
    {
        gl_Position = CC_PMatrix * a_position;
        v_fragmentColor = a_color;
        v_texCoord = a_texCoord;
    }
]]

-- 变灰 shader， 引擎里面也有
function shaders.gray(  )
    -- 片段 shader
    local fragment = [[
        #ifdef GL_ES
        precision mediump float;  // shader默认精度为double, openGL为了提升渲染效率将精度设为float
        #endif

        // varying 变量为顶点 shader 经过光栅化阶段的线性插值后传给片段着色器
        varying vec4 v_fragmentColor;  // 颜色
        varying vec2 v_texCoord;       // 坐标
        void main(void)
        {
            // texture2D方法从采样器中进行纹理采样，得到当前片段的颜色值。CC_Texture0即为一个采样器
            vec4 c = texture2D(CC_Texture0, v_texCoord);

            // c.rgb即是像素点的三种颜色，dot为点乘，vec3为经验值，可以随意修改
            float gray = dot(c.rgb, vec3(0.299, 0.587, 0.114));

            // shader的内建变量，表示当前片段的颜色
            gl_FragColor.xyz = vec3(gray);

            // a为透明度
            gl_FragColor.a = c.a;
        }
    ]]

    local program = cc.GLProgram:createWithByteArrays(vertex , fragment)
    return program
end


-- 圆角
function shaders.round(  )
    local fragment = [[
    #ifdef GL_ES
    precision mediump float;  // shader默认精度为double, openGL为了提升渲染效率将精度设为float
    #endif

    varying vec4 v_fragmentColor;
    varying vec2 v_texCoord;

    uniform float u_edge;

    void main()
    {
        float edge = u_edge; //0.04;
        float dis = 0.0;
        vec2 texCoord = v_texCoord;
        if ( texCoord.x < edge )
        {
            if ( texCoord.y < edge )
            {
                dis = distance( texCoord, vec2(edge, edge) );
            }
            if ( texCoord.y > (1.0 - edge) )
            {
                dis = distance( texCoord, vec2(edge, (1.0 - edge)) );
            }
        }
        else if ( texCoord.x > (1.0 - edge) )
        {
            if ( texCoord.y < edge )
            {
                dis = distance( texCoord, vec2((1.0 - edge), edge ) );
            }
            if ( texCoord.y > (1.0 - edge) )
            {
                dis = distance( texCoord, vec2((1.0 - edge), (1.0 - edge) ) );
            }
        }

        if(dis > 0.001)
        {
            float gap = edge * 0.1;
            if(dis <= edge - gap)
            {
                gl_FragColor = texture2D( CC_Texture0,texCoord);
            }
            else if(dis <= edge)
            {
                gl_FragColor = texture2D( CC_Texture0,texCoord) * (gap - (dis - edge + gap))/gap;
            }
        }
        else
        {
            gl_FragColor = texture2D( CC_Texture0,texCoord);
        }
    }
    ]]

    local program = cc.GLProgram:createWithByteArrays(vertex , fragment)
    -- program:setUniformLocationF32("u_edge", 0.04)
    return program
end

function shaders.light2d(  )
    local vertex = [[
    attribute vec4 a_position;
    attribute vec2 a_texCoord;

    #ifdef GL_ES
    varying mediump vec2 v_texCoord;
    varying mediump vec2 v_position;//将顶点的位置传给ps，用于计算该顶点与灯的距离
    #else
    varying vec2 v_texCoord;
    varying vec2 v_position;
    #endif

    void main()
    {
        v_position = a_position.xy;
        gl_Position = CC_PMatrix * a_position;
        v_texCoord = a_texCoord;
    }
    ]]

    local fragment = [[
    #ifdef GL_ES
    varying lowp vec2 v_texCoord;
    varying mediump vec2 v_position;
    #else
    varying vec2 v_texCoord;
    varying vec2 v_position;
    #endif

    uniform vec2 u_lightPosition;
    uniform vec4 u_lightColor;
    uniform float u_lightRange;
    vec4 getRenderColor(vec2 texPos, vec2 lightPos, float lightRange)
    {
        vec2 pos = texPos - lightPos;
        float d = length(pos);  //顶点与灯的距离
        float rgb = 0.5;              //相当于光强度
        if (d > 30.0) //距离大于30，在lightRange范围内，灯光离灯心越远颜色越亮的遮罩效果，下面需要对颜色进行反转以实现灯光变亮
        {
            rgb = (d-30.0) / (lightRange);
        }
        else //距离小于30灯光最强，为白色
        {
            rgb = 0.0;
        }
        rgb = 1.0 - clamp(rgb, 0.0, 1.0); //clamp意义为 min(max(a, b), c);将a的大小限制在b,c之间， 1-rgb是将颜色反转
        return vec4(rgb, rgb, rgb, 1.0);
    }
    void main()
    {
        vec4 color = u_lightColor * getRenderColor(v_position, u_lightPosition, u_lightRange);//灯光颜色与灯光强度混合
        color = clamp(color, 0.0, 1.0);
        gl_FragColor = texture2D(CC_Texture0, v_texCoord) * color ;//纹理与灯光混合

        gl_FragColor = texture2D(CC_Texture0, v_texCoord);
    }
    ]]

    local program = cc.GLProgram:createWithByteArrays(vertex , fragment)
    return program
end

function shaders.hsl(  )
    local fragment = [[
    #ifdef GL_ES
    precision mediump float;
    #endif

    varying vec2 v_texCoord;
    uniform sampler2D CC_Texture0;
    uniform float u_dH;
    uniform float u_dS;
    uniform float u_dL;

    void main() {

        vec4 texColor=texture2D(CC_Texture0, v_texCoord);
        float r=texColor.r;
        float g=texColor.g;
        float b=texColor.b;
        float a=texColor.a;
        //convert rgb to hsl
        float h;
        float s;
        float l;
        {
            float max=max(max(r,g),b);
            float min=min(min(r,g),b);
            //----h
            if(max==min){

                h=0.0;
            }else if(max==r&&g>=b){
                h=60.0*(g-b)/(max-min)+0.0;
            }else if(max==r&&g<b){
                h=60.0*(g-b)/(max-min)+360.0;
            }else if(max==g){
                h=60.0*(b-r)/(max-min)+120.0;
            }else if(max==b){
                h=60.0*(r-g)/(max-min)+240.0;
            }
            //----l
            l=0.5*(max+min);
            //----s
            if(l==0.0||max==min){
                s=0.0;
            }else if(0.0<=l&&l<=0.5){
                s=(max-min)/(2.0*l);
            }else if(l>0.5){
                s=(max-min)/(2.0-2.0*l);
            }
        }
        //(h,s,l)+(dH,dS,dL) -> (h,s,l)
        h=h+u_dH;
        s=min(1.0,max(0.0,s+u_dS));
        l=l+u_dL;
        //convert (h,s,l) to rgb and got final color
        vec4 finalColor;
        {
            float q;
            if(l<0.5){
                q=l*(1.0+s);
            }else if(l>=0.5){
                q=l+s-l*s;
            }
            float p=2.0*l-q;
            float hk=h/360.0;
            float t[3];
            t[0]=hk+1.0/3.0;t[1]=hk;t[2]=hk-1.0/3.0;
            for(int i=0;i<3;i++){
                if(t[i]<0.0)t[i]+=1.0;
                if(t[i]>1.0)t[i]-=1.0;
            }//got t[i]
            float c[3];
            for(int i=0;i<3;i++){
                if(t[i]<1.0/6.0){
                    c[i]=p+((q-p)*6.0*t[i]);
                }else if(1.0/6.0<=t[i]&&t[i]<0.5){
                    c[i]=q;
                }else if(0.5<=t[i]&&t[i]<2.0/3.0){
                    c[i]=p+((q-p)*6.0*(2.0/3.0-t[i]));
                }else{
                    c[i]=p;
                }
            }
            finalColor=vec4(c[0],c[1],c[2],a);
        }

        finalColor+=vec4(u_dL,u_dL,u_dL,0.0);

        gl_FragColor=finalColor;

    }
    ]]

    local program = cc.GLProgram:createWithByteArrays(vertex, fragment)
    assert(program, 'program is nil')
    return program
end
return shaders
