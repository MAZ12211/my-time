local w = 0.0
local w1 = 0.0
local w2 = 0.0
local w3 = 0.0

local resizeX = 1290
local resizeY = 720

function resize()
    resizeWindow(resizeX,resizeY)
end

function start (song)
    useDownscroll(false)
	w = getScreenWidth()
	w1 = (w / 4) * 2 + (getWindowWidth() / 1) + 100
	w2 = w / -2.5
	w3 = (w / 1000) * 1.45
	setWindowPos((getScreenWidth() / 2 - getWindowWidth() / 2),  (getScreenHeight() / 2 - getWindowHeight() / 2))
    initBackgroundVideo("omorifall1080p")
    for i = 0, 7 do 
        setActorX(1300, i)
    end
    showOnlyStrums = true
    setActorAlpha(0,'boyfriend')
    resize(0)
    fpsCap = 30
end

function songStart()
    for i = 0, 3 do
        if getActorAlpha(i) ~= 0 then 
            setActorAlpha(0,i)
        end
    end
    for i = 4, 7 do -- go to the center
        tweenPosXAngle(i, _G['defaultStrum'..i..'X'] - 575,getActorAngle(i) + 0, -40, 'setDefault')
    for i = 4, 7 do -- go to the center
            tweenPosXAngle(i, _G['defaultStrum'..i..'X'] - 575,getActorAngle(i) + 0, -40, 'setDefault')
        end
    end
    tweenFadeIn('boyfriend',0,0)
    end
if step == 293 then
    for i = 4, 7 do 
        if getActorX(i) ~= 0 then 
            setActorX(1300, i)
        end
    end
end