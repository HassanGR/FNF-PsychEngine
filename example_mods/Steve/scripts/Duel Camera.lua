-- Made by BrokenTube
-- I got inspired by SteveTheCreeper's script "Camera Set Target" to make this (also stole some code >:) )
-- This script auto adjusts camera position when both (player and opponent) are singing at the same time

function opponentNoteHit(id, noteData, noteType, isSustainNote)
    timeOP = getPropertyFromGroup("notes", id, "strumTime")
end

function goodNoteHit(id, noteData, noteType, isSustainNote)
    timeBF = getPropertyFromGroup("notes", id, "strumTime")
end

function onUpdate(elapsed)
    triggerEvent('Camera Follow Pos', nil, nil)
    if timeOP == timeBF then
    
        triggerEvent('Camera Follow Pos',getMidpointX('gf')+getProperty('gf.cameraPosition[0]'),getMidpointY('gf')+getProperty('gf.cameraPosition[1]'));
        

    end
end
