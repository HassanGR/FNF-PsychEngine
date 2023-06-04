function onCreatePost()
    local json = dofile('assets/scripts/JSONLIB.lua', true)
    local jsonTable = json.parse(getTextFromFile('weeks/' .. week .. '.json'),true)
    
    for _, song in ipairs(jsonTable.songs) do
        local jsonSongName = song[1]
        if string.lower(jsonSongName) == songPath then
            debugPrint('R: '..song[3][1]..'\nG: '..song[3][2]..'\nB: '..song[3][3])
            setProperty('timeBar.color',getColorFromHex(rgbToHex({song[3][1],song[3][2],song[3][3]})))
            break
        end
    end
end

function rgbToHex(array)
	return string.format('%.2x%.2x%.2x', array[1], array[2], array[3])
end