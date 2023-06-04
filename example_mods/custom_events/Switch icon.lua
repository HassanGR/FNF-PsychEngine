function onEvent(n, v1, v2)

    if n == 'Switch icon' then

        loadGraphic('iconP'..v1,'icons/'..v2,150)
        addAnimation('iconP'..v1, 'idle', {0,1}, 0, true)
        setProperty('iconP'..v1..'.flipX', v1 == 1)
        playAnim('iconP'..v1,'idle',true)
        
    end
end