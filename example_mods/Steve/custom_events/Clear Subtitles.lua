function onEvent(n, v1, v2)
    if n == "Clear Subtitles" then
        doTweenAlpha("subAlpha", "sub", 0, 0.7, "expoOut")
        doTweenAlpha("subby1", "bar1", 0, 1.075, "expoOut")
        doTweenAlpha("subby2", "bar2", 0, 1.075, "expoOut")
        doTweenY("bos1", "bar1", -200, 1.075, "expoOut")
        doTweenY("bos2", "bar2", 920, 1.075, "expoOut")
    end
end