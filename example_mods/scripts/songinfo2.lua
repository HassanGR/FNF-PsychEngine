Composer = "Tankman hehe"

function onCreatePost()

    makeLuaText("songinfo", songName.." - "..difficultyName.." / Composed by "..Composer.." | Psych Engine "..version.."("..buildTarget..")", 90, 20, 60)
    setProperty("songinfo.y", getPropertyFromGroup("strumLineNotes", 0, "y")+getPropertyFromGroup("strumLineNotes", 0, "height") / 2-getProperty("songinfo.height") / 2) -- to make the text always centered :)))))))
    addLuaText("songinfo") -- add the good old text :)

end