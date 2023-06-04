local isTextExist = false

function onEvent(n, v1, v2)
    if n == "add subtitle" then
        if isTextExist then

            removeLuaText("sumshit", true)

            isTextExist = false

            makeLuaText("sumshit", parseText(v1, 7), 0, 200)
            setTextSize("sumshit", 18)
            screenCenter("sumshit", "x")
            setObjectCamera("sumshit", "camHUD")
            addLuaText("sumshit")

            isTextExist = true
        -- make text shit here
        end
    end
end

function parseText(text, wordsPerLine)
    local words = {}
    local parsedText = ''
    for word in text:gmatch("%S+") do
      table.insert(words, word)
      --makes the text into an array with all words.
    end
    firstWord = true
    for i=1, #words do
      parsedText = parsedText..(firstWord and '' or ' ')..words[1]
      firstWord = false
      table.remove(words, 1)
      if i%wordsPerLine == 0 then
        parsedText = parsedText..'\n'
        firstWord = true
      end
    end
    return parsedText
  end