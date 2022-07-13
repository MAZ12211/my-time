local w = 0.0
local w1 = 0.0
local w2 = 0.0
local w3 = 0.0

local resizeX = 1280
local resizeY = 720

function resize()
    resizeWindow(resizeX,resizeY)
end

function start (song)
    useDownscroll(false)
	w = getScreenWidth()
	w1 = (w / 4) * 2 + (getWindowWidth() / 2) + 100
	w2 = w / -2.5
	w3 = (w / 1000) * 1.45
	setWindowPos((getScreenWidth() / 2 - getWindowWidth() / 2),  (getScreenHeight() / 2 - getWindowHeight() / 2))
    initBackgroundVideo("omorifalllow")
    for i = 0, 7 do 
        setActorX(1300, i)
    end
    showOnlyStrums = true
    setActorAlpha(0,'boyfriend')
    resize()
end

function setDefault(id)
	_G['defaultStrum'..id..'X'] = getActorX(id)
end


function songStart()
    for i = 0, 3 do
        if getActorAlpha(i) ~= 0 then 
            setActorAlpha(0,i)
        end
    end
    for i = 4, 7 do -- go to the center
        tweenPosXAngle(i, _G['defaultStrum'..i..'X'] - 575,getActorAngle(i) + 0, -40, 'setDefault')
    end
    tweenFadeIn('boyfriend',0,0)
end

local defaultHudX = 0
local defaultHudY = 0

local defaultWindowX = 0
local defaultWindowY = 0

local moveWindow = false


local xTo4 = 0
local xTo5 = 0
local xTo6 = 0
local bfX = 0


local xTo7 = 0


function defaultWindow()
    setHudPosition(defaultHudX,defaultHudY)
    setWindowPos((getScreenWidth() / 2 - getWindowWidth() / 2),  (getScreenHeight() / 2 - getWindowHeight() / 2))
    setHudAngle(0)
end

function update (elapsed) 
    local currentBeat = (songPos / 1000)*(bpm/60)

    if moveWindow then
        setHudPosition(defaultHudX + 64 * math.sin((currentBeat * 0.35) * math.pi), defaultHudY + 64 * math.cos((currentBeat * 0.35) * math.pi))
        setWindowPos(defaultWindowX + 64 * math.sin((currentBeat * 0.35) * math.pi), defaultWindowY + 64 * math.cos((currentBeat * 0.35) * math.pi))
    else 
        setWindowPos((getScreenWidth() / 2 - getWindowWidth() / 2),  (getScreenHeight() / 2 - getWindowHeight() / 2))
    end
end


function beatHit (beat)

end



function bumpArrows()

    setActorX(xTo4, 4)
    tweenPos(4,xTo4 + 120,getActorY(4),0.5)
    setActorX(xTo5, 5)
    tweenPos(5,xTo5 + 60,getActorY(5),0.5)

    setActorX(xTo6, 6)
    tweenPos(6,xTo6 - 60,getActorY(6),0.5)
    setActorX(xTo7, 7)
    tweenPos(7,xTo7 - 120, getActorY(7),0.5)
end

local startBumping = false


local lastStep = 0

function stepHit (step)
    if lastStep ~= step then
        lastStep = step
        if step == 53 then

            for i = 0, 3 do
                if getActorAlpha(i) ~= 0 then 
                    setActorAlpha(0,i)
                end
            end

            defaultWindowX = getWindowX()
            defaultWindowY = getWindowY()

            xTo4 = getActorX(4) - 120
            xTo5 = getActorX(5) - 60
            xTo6 = getActorX(6) + 60
            xTo7 = getActorX(7) + 120

            defaultHudX = getHudX()
            defaultHudY = getHudY()

            bfX = getActorX('boyfriend')
        
            print("set values " .. xTo4 .. " "  .. xTo5 .. " "  .. xTo6 .. " "  .. xTo7)
        end
    end
end