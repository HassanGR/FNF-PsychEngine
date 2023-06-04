-- credits to Laztrix for helping with basically everything
-- and Tankman for uhh, honestly idk Laz did everything (Tankman is main coder tho, but shame on him for not doing anything jeje)

dodgestart = false
dodge = false
dDodgeH = 0.5

function onCreatePost()

    makeLuaSprite("redvg", "RedVG", 0, 0)
    setObjectCamera("redvg", "camHUD")
    setProperty("redvg.alpha", 0) -- making it invisible at the beginning >:)
    addLuaSprite("redvg", true) -- adding it with being at the front

    makeLuaSprite("getready", "caniputmyballs", 640, 200)
    setObjectCamera("getready", "camHUD")
    setProperty("getready.alpha", 0)
    addLuaSprite("getready", false) -- not in front this time

    makeAnimatedLuaSprite("spacef", "SPACEF", 60, 200)
    addAnimationByPrefix("spacef", "SPACEF", "SPACEF idle", 24, true)
    setObjectCamera("spacef", "camHUD")
    setProperty("spacef.alpha", 0)
    addLuaSprite("spacef", false)

end

function onEvent(n, v1, v2)
    if n == "dodge" then -- if this event is triggered

        dodgestart = true -- start the dodge mechanic
        dodge = false

        doTweenAlpha("redvgstart", "redvg", 1, 0.5, "circInOut") -- make it vissible >:)
        doTweenAlpha("getreadystart", "getready", 1, 0.25, "circOut") -- also this
        doTweenAlpha("spacefstart", "spacef", 1, 0.25, "circOut") -- also this
        runTimer("sexo", 2) -- 2 second before death coming to you

    end
end

function onUpdate(elapsed)

    if dodgestart and keyboardJustPressed('SPACE') and not dodge then -- if the player dodged

        dodge = true
        dodgestart = false -- end of dodge

        cameraShake('camHUD',0.005,0.25) -- do good camera shake
        cameraFlash("other", "0xFFFFFF", 0.25, true) -- and make the camera white for 0.25 seconds
        doTweenAlpha("redvggone", "redvg", 0, 0.5) -- and while the screen is white make its alpha 0 >:)
        setProperty("getready.alpha", 0) -- also this one
        setProperty("spacef.alpha", 0) -- also this one
        debugPrint('congrats you did press the space button') -- this is supposed to be for testing but nah its good lol

    end
end

function onTimerCompleted(t, loops, loopsLeft) -- when the dodge mechanic have ended

    if t == "sexo" and not dodge then -- and the player didnt dodge :(

        debugPrint('PRESS THE SPACE BUTTON GRAHHH') -- tell the player this
        debugPrint(":(") -- also dont forget the sad face :)

        dodge = false
        dodgestart = false -- end of dodge

        addHealth(-dDodgeH) -- decrease the players health
        playSound("damagesfx", 100 / 100) -- devide 100 by 100 to get 1, which is the maximum amount
        cameraShake('camHUD',0.01,0.5) -- shake the camera
        cameraFlash("other", "0xFFFFFF", 0.25, true) -- make the camera white
        doTweenAlpha("redvggone", "redvg", 0, 0.5) -- make this invisible while the camera is white
        setProperty("getready.alpha", 0) -- also this
        setProperty("spacef.alpha", 0) -- also this

    end
end

function onTweenCompleted(tt)

    if dodgestart then
        if tt == "redvgstart" then

            doTweenAlpha("redvgloop", "redvg", 0, 1, "circInOut") -- it loops :0

        end
        if tt == "redvgloop" then

            doTweenAlpha("redvgstart", "redvg", 1, 0.5)

        end
    end
end

function onBeatHit()

     if dodgestart then

        scaleObject('getready', 1.35,1.25, false)
        scaleObject('spacef', 1.35,1.25, false)

        if curBeat % 2 == 0 then -- genius stuff, if the beat is even

            doTweenAngle("getreadyan", "getready", 10, 0.5, "circOut") -- make the text bop to the right
            doTweenAngle("spacefyan", "spacef", -10, 0.5, "circOut") -- make the sprite bop to the left

         else -- if its odd

            doTweenAngle("getreadyan", "getready", -10, 0.5, "circOut") -- bop to the left
            doTweenAngle("spacefyan", "spacef", 10, 0.5, "circOut") -- make the sprite bop to the right
         end

        doTweenX('getreadyX','getready.scale',1,1,'circOut') -- scale in x more than y, and also take longer time so it looks good >:)
        doTweenY('getreadyY','getready.scale',1,0.3,'circOut') -- scale y
        doTweenY('spacefY','spacef.scale',1,1,'circOut') -- scale in x more than y, and also take longer time so it looks good >:)
        doTweenX('spacefX','spacef.scale',1,0.3,'circOut') -- scale y

     end
end
