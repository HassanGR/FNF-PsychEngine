function onCreate()
    makeLuaText("sub", "holy fuck is that subtitles", 0, 0, 550)
    setTextAlignment("sub", "center")
    setTextSize("sub", 28)
    addLuaText("sub")
    setProperty("sub.alpha", 0)

    makeLuaSprite("bar1", nil, 0, -200)
    makeLuaSprite("bar2", nil, 0, 820)

    makeGraphic("bar1", 10000, 200, "000000")
    makeGraphic("bar2", 10000, 200, "000000")

    setObjectCamera("bar1", "camHUD")
    setObjectCamera("bar2", "camHUD")

    addLuaSprite("bar1")
    addLuaSprite("bar2")
end

function onEvent(n, v1, v2)
    if n == "Set or Add Subtitles" then

        screenCenter("sub", "x")
        screenCenter("bar1", "x")
        screenCenter("bar2", "x")

        doTweenAlpha("subby1", "bar1", 1, 1.075, "expoOut")
        doTweenAlpha("subby2", "bar2", 1, 1.075, "expoOut")

        scaleObject("sub", 1.35, 1.35)
        doTweenX('subbyX','sub.scale',1,1,'expoOut') -- scale in x more than y, and also take longer time so it looks good >:)
        doTweenY('subbyY','sub.scale',1,1,'expoOut') -- scale y

        scaleObject("bar1", 1.35, 1.35)
        scaleObject("bar2", 1.35, 1.35)
        doTweenX('barryX1','bar1.scale',1,1,'expoOut') -- scale in x more than y, and also take longer time so it looks good >:)
        doTweenY('barryY2','bar2.scale',1,1,'expoOut') -- scale y
        doTweenX('barryX2','bar1.scale',1,1,'expoOut') -- scale in x more than y, and also take longer time so it looks good >:)
        doTweenY('barryY','bar2.scale',1,1,'expoOut') -- scale y

        setProperty("sub.alpha", 1)

        doTweenY("sub1", "bar1", -100, 1.675, "expoOut")
        doTweenY("sub2", "bar2", 620, 1.675, "expoOut")

        if v2 == "0" then
            setTextString("sub", v1)
        else
            setTextString("sub", getTextString("sub")..tostring(v1))
        end
    end
end
