paused = false
timepaused = 0
customPauseDebug = false

function onPause()
    if not getPropertyFromClass('PlayState', 'chartingMode') or customPauseDebug and not getProperty('inCutscene') then
	return Function_Stop;
    end 
    return Function_Continue;
end


function onUpdatePost()
    if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.TAB') and getPropertyFromClass('PlayState', 'chartingMode') then -- Debug for Charting Mode, Press TAB
        if not customPauseDebug then
        customPauseDebug = true
        debugPrint('Custom Pause in charting Mode: ON')
        else
        customPauseDebug = false
        debugPrint('Custom Pause in charting Mode: OFF')
        end
    end

	if paused == true then
        funnyDiff = getProperty('storyDifficultyText')
        setPropertyFromClass('flixel.FlxG', 'mouse.visible', true);

        changePresence('Paused', ''..songName..' - ('..funnyDiff.. ")", '', false)
		setPropertyFromClass('Conductor', 'songPosition', timepaused)
		setPropertyFromClass('flixel.FlxG', 'sound.music.time', timepaused)
		setProperty('vocals.time', timepaused)

		setPropertyFromClass('flixel.FlxG', 'sound.music.volume', 0)
		setProperty('vocals.volume', 0)
    end
    bigpp()
end

function onDestroy()
	setPropertyFromClass('flixel.FlxG', 'mouse.visible', false);
end

function bigpp()
	if keyJustPressed('pause') and not inGameOver and not getProperty('inCutscene') then
        if not getPropertyFromClass('PlayState', 'chartingMode') or customPauseDebug then
		if paused == false then
            timepaused = getSongPosition()
			paused = true
            makethepause()
        end
        end
	end
    if mousePressed('left') then
        if paused == true then
            if getMouseX('other') > 200 and getMouseX('other') < 450 and getMouseY('other') > 550 and getMouseY('other') < 630 then
            restartSong(false);
            end
            if getMouseX('other') > 520 and getMouseX('other') < 520 + 250 and getMouseY('other') > 550  and getMouseY('other') < 630 then
                if songName == 'Exploitation' then
                    os.exit()
                end
            exitSong(false);
            end
            if getMouseX('other') > 840 and getMouseX('other') < 840 + 250 and getMouseY('other') > 550  and getMouseY('other') < 630 then
            paused = false
            select = 0
            hidethepause()
            end
        end
    end
        if getMouseX('other') > 200 and getMouseX('other') < 450 and getMouseY('other') > 550 and getMouseY('other') < 630 then
        makeGraphic('b1', 250, 80, 'FFFFFF')
        else
        makeGraphic('b1', 250, 80, '4e5460')
        end
        if getMouseX('other') > 520 and getMouseX('other') < 520 + 250 and getMouseY('other') > 550  and getMouseY('other') < 630 then
        makeGraphic('b11', 250, 80, 'FFFFFF')
        else
        makeGraphic('b11', 250, 80, '4e5460')
        end
        if getMouseX('other') > 840 and getMouseX('other') < 840 + 250 and getMouseY('other') > 550  and getMouseY('other') < 630 then
        makeGraphic('b111', 250, 80, 'FFFFFF')
        else
        makeGraphic('b111', 250, 80, '4e5460')
    end
end

function makethepause()
    setProperty('boyfriend.stunned', true)

    makeLuaSprite('underlay', '', 0, 0)
    makeGraphic('underlay', screenWidth, screenHeight, '000000')
    setObjectCamera('underlay', 'other')
    addLuaSprite('underlay', false)
    setProperty('underlay.alpha', 0.6)

    makeAnimatedLuaSprite('ico', nil, 0, 0)
    loadGraphic('ico', 'icons/icon-'..getProperty('dad.healthIcon'), 150)
    addAnimation('ico', getProperty('dad.healthIcon'), {0, 1}, 0, true)
    setObjectCamera('ico', 'other')
    screenCenter('ico')
    addLuaSprite('ico')
    setProperty('ico.x', getProperty('ico.x') - 150)
    setProperty('ico.animation.curAnim.curFrame', 0)
    scaleObject('ico', 1, 1)

    makeAnimatedLuaSprite('ico2', nil, 0, 0)
    loadGraphic('ico2', 'icons/icon-'..getProperty('boyfriend.healthIcon'), 150)
    addAnimation('ico2', getProperty('boyfriend.healthIcon'), {0, 1}, 0, true)
    setObjectCamera('ico2', 'other')
    screenCenter('ico2')
    addLuaSprite('ico2')
    setProperty('ico2.x', getProperty('ico2.x') + 150)
    setProperty('ico2.animation.curAnim.curFrame', 0)
    scaleObject('ico2', -1, 1)


    makeLuaText('d', 'Pause Screen by n_bonnie2' , 1280, 0, 650)
    setTextSize('d', 25)
    setTextAlignment('d', 'center')
    setObjectCamera('d', 'other')
    addLuaText('d')
    
    funnyDiff = getProperty('storyDifficultyText')
    makeLuaText('de', 'PAUSED: '..songName..' - ('..funnyDiff.. ")" , 1280, 0, 200)
    setTextSize('de', 25)
    setTextAlignment('de', 'center')
    setObjectCamera('de', 'other')
    addLuaText('de')

    makeLuaText('deez', 'Blueballed: '..getPropertyFromClass('PlayState', 'deathCounter')..'' , 1280, 0, 240)
    setTextSize('deez', 25)
    setTextAlignment('deez', 'center')
    setObjectCamera('deez', 'other')
    addLuaText('deez')

    makeLuaSprite('b1', '', 200, 550) --1
    makeGraphic('b1', 250, 80, '4e5460')
    setObjectCamera('b1', 'other')
    addLuaSprite('b1', false)

    makeLuaText('d1', 'Restart' , 630, 0, 580)
    setTextSize('d1', 25)
    setTextAlignment('d1', 'center')
    setObjectCamera('d1', 'other')
    addLuaText('d1')

    makeLuaSprite('b11', '', 520, 550) -- 2
    makeGraphic('b11', 250, 80, '4e5460')
    setObjectCamera('b11', 'other')
    addLuaSprite('b11', false)

    makeLuaText('d11', 'Back To Menu' , 1300, 0, 580)
    setTextSize('d11', 25)
    setTextAlignment('d11', 'center')
    setObjectCamera('d11', 'other')
    addLuaText('d11')

    makeLuaSprite('b111', '', 840, 550) -- 3
    makeGraphic('b111', 250, 80, '4e5460')
    setObjectCamera('b111', 'other')
    addLuaSprite('b111', false)

    makeLuaText('d111', 'Resume' , 1900, 0, 580)
    setTextSize('d111', 25)
    setTextAlignment('d111', 'center')
    setObjectCamera('d111', 'other')
    addLuaText('d111')

    makeLuaSprite('baaaaaa', '', 200, 100) --the top
    makeGraphic('baaaaaa', 900, 80, '4e5460')
    setObjectCamera('baaaaaa', 'other')
    addLuaSprite('baaaaaa', false)

    makeLuaSprite('baaaaaa1', '', 200, 100) --the top
    makeGraphic('baaaaaa1', 900, 10, 'FFFFFF')
    setObjectCamera('baaaaaa1', 'other')
    addLuaSprite('baaaaaa1', false)

    makeLuaSprite('ftimebu', '', 495, 395) -- fake time bar
    makeGraphic('ftimebu', 290, 20, '000000')
    setObjectCamera('ftimebu', 'other')
    addLuaSprite('ftimebu', false)

    makeLuaSprite('ftimeb', '', 500, 400)
    makeGraphic('ftimeb', 280 * (getProperty('songTime')/getProperty('songLength')), 10, 'FFFFFF')
    setObjectCamera('ftimeb', 'other')
    addLuaSprite('ftimeb', false)

end

function hidethepause()

    setProperty('boyfriend.stunned', false)	
    setPropertyFromClass('flixel.FlxG', 'sound.music.volume', 1)
    setProperty('vocals.volume', 1)	
    setProperty('underlay.visible', false)
    setProperty('d.visible', false)
    setProperty('de.visible', false)
    setProperty('deez.visible', false)
    setProperty('b1.visible', false)
    setProperty('d1.visible', false)
    setProperty('b11.visible', false)
    setProperty('d11.visible', false)
    setProperty('b111.visible', false)
    setProperty('d111.visible', false)
    setProperty('baaaaaa.visible', false)
    setProperty('baaaaaa1.visible', false)
    setProperty('ico2.visible', false)
    setProperty('ico.visible', false)
    setProperty('ftimebu.visible', false)
    setProperty('ftimeb.visible', false)
end