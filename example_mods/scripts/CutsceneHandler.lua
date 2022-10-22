
allow = false
allow2 = false
Dialouge = false
diaText = {}
diaChar = {}
diaDelay = {}
diaCam = {}
amountOfDia = 0
ialougeNum = 1
hasDia = false
-- Messy Code 101
-----------------------------------------------------------
function dialouges(type)
    diaText = {}
    diaChar = {}
    diaDelay = {}
    diaCam = {}
    hasDia = false
    amountOfDia = 0
    if type == 'Pre-Song' then
    if songName == 'Funkin-Up' then
        addDialouge('1v1 me.', 'Boyfriend', 0.05, 'bf')
        addDialouge('ok', 'n_bonnie2', 0.05, 'dad')
        addDialouge('but you gotta promise I pick the songs', 'n_bonnie2', 0.05, 'dad')
        addDialouge('Beep!', 'Boyfriend', 0.05, 'bf')
        addDialouge('Why am I doing this anyways...', 'n_bonnie2', 0.05, 'dad')
        hasDia = true
        setUpDialouge() 
    end

    if songName == 'Complexity' then
        addDialouge('Not bad, man.\n Oh! what about we do a slightly harder song.', 'n_bonnie2', 0.05, 'dad')
        addDialouge('Bep!', 'Boyfriend', 0.05, 'bf')
        addDialouge('Don\'t say I didn\'t warn you.', 'n_bonnie2', 0.05, 'dad')
        hasDia = true
        setUpDialouge() 
    end

    if songName == 'Outrage' then
        addDialouge('lol ez', 'Boyfriend', 0.05, 'bf')
        addDialouge('I\'m not gonna go easy on you now....', 'n_bonnie2', 0.05, 'dad')
        addDialouge('You have pulled my last straw.', 'n_bonnie2', 0.05, 'dad')
        addDialouge('bop....', 'Boyfriend', 0.05, 'bf')
        addDialouge('You know what is gonna come next...', 'n_bonnie2', 0.05, 'dad')
        hasDia = true
        setUpDialouge() 
    end

    
    if songName == 'Ncounter' then -- Eweek 2 Dialouges were written by Jack_E_ himself
        addDialouge('Beep!', 'Boyfriend', 0.05, 'bf')
        addDialouge('...', 'Jack_E_', 0.1, 'dad')
        addDialouge('bep?!', 'Boyfriend', 0.05, 'bf')
        addDialouge('Could you not be annoying. this is not Funky Friday.', 'Jack_E_', 0.05, 'dad')
        addDialouge('beep boop', 'Boyfriend', 0.05, 'bf')
        addDialouge('Fine, but you might DIE.', 'Jack_E_', 0.05, 'dad')
        addDialouge('(Why is there a jukebox here?)', 'Jack_E_', 0.05, 'dad')
        hasDia = true
        setUpDialouge() 
    end

    if songName == 'Rocket' then
        addDialouge('I see, you truly are...', 'Jack_E_', 0.05, 'dad')
        addDialouge('Truely annoying', 'Jack_E_', 0.05, 'dad')
        addDialouge('*Beep Boops aggresively*', 'Boyfriend', 0.05, 'bf')
        hasDia = true
        setUpDialouge() 
    end

    if songName == 'Intense' then
        addDialouge('I\'m afraid...', 'Jack_E_', 0.05, 'dad')
        addDialouge('Y O U', 'Jack_E_', 0.05, 'dad')
        addDialouge('A R E', 'Jack_E_', 0.05, 'dad')
        addDialouge('O N', 'Jack_E_', 0.05, 'dad')
        addDialouge('Y O U R L A S T L I F E', 'Jack_E_', 0.1, 'dad')
        addDialouge('...', 'Jack_E_', 0.1, 'dad')
        addDialouge('*Beep Boops aggresively yet again while girlfriend is just sitting there*', 'Boyfriend', 0.05, 'bf')
        hasDia = true
        setUpDialouge() 
    end

    if songName == 'EvilGuest' then
        addDialouge('beep?', 'Boyfriend', 0.05, 'bf')
        addDialouge('...', 'evilguestandraven', 0.1, 'dad')
        addDialouge('ok', 'evilguestandraven', 0.05, 'dad')
        addDialouge('bep bop!', 'Boyfriend', 0.05, 'bf')
        addDialouge('(They just decided to sing without an answer)', 'Narrator', 0.05, 'bf')
        hasDia = true
        setUpDialouge() 
    end

    if songName == 'Grinding' then
        addDialouge('...', 'evilguestandraven', 0.1, 'dad')
        addDialouge('bop beop ski?', 'Boyfriend', 0.05, 'bf')
        hasDia = true
        setUpDialouge() 
    end

    if songName == 'Eclipse' then
        makeLuaSprite('dark', nil, 0, 0)
        makeGraphic('dark', screenWidth, screenHeight,'000000')
        setObjectCamera('dark', 'other')
        addLuaSprite('dark')
        addDialouge('D I E', 'evilguestandraven', 0.1, '')
        hasDia = true
        runTimer('E1', 1)
    end
end
end
------------------------------------------------------------
function onStartCountdown()
    if not allow and isStoryMode and not seenCutscene then
    --setProperty('skipCountdown', false)

    dialouges('Pre-Song')
    if hasDia then
        setProperty('inCutscene', true)
        allow = true
        return Function_Stop;
    end
    end
    return Function_Continue;
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'E1' then -- eclipse cutscene
        doTweenX('xfindshisvalue', 'camFollowPos', 600, 1, 'circInOut')
        doTweenY('yrudoingthis', 'camFollowPos', 350, 1, 'circInOut')
        doTweenZoom('S2', 'camGame', 2, 1, 'circInOut')
        playSound('w5on', 0.5)
        removeLuaSprite('dark', true)
        runTimer('start dia', 1.6)
	end
    -- DO NOT MESS WITH THESE --
    if tag == 'start' then
        startCountdown()
	end
    if tag == 'start dia' then
        setUpDialouge()     
	end
    if tag == 'type letter' then
        Dletter = (loops - loopsLeft)
        setTextString('charName', diaChar[dialougeNum]..':')
        setTextString('DText', string.sub(diaText[dialougeNum], 0, Dletter))
        playSound('dialogue')
    end
end

function onUpdatePost()
    if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.SPACE') or getPropertyFromClass('flixel.FlxG', 'keys.justPressed.ENTER') then
        if Dialouge then
            if dialougeNum == amountOfDia then
            clearDialouge()
            else
            stopSound('dialouge')
            playSound('dialogueClose')
            dialougeNum = dialougeNum + 1
            cancelTimer('type letter')
            runTimer('type letter', diaDelay[dialougeNum], string.len(diaText[dialougeNum]))
            camerah(diaCam[dialougeNum])
            end
        end
    end
end

function setUpDialouge(isPost)
    Dialouge = true
    makeLuaSprite('box', nil ,0 , 480)
    makeGraphic('box', screenWidth, 800, '000000')
    setObjectCamera('box', 'other')
    addLuaSprite('box', true)
    setProperty('box.alpha', 0.5)

    makeLuaText('charName', '', screenWidth, 0, 450)
    setObjectCamera('charName', 'other')
    setTextAlignment('charName', 'center')
    setTextSize('charName', 20)
    addLuaText('charName')

    makeLuaText('DText', '', screenWidth - 200, 100, 500)
    setObjectCamera('DText', 'other')
    setTextAlignment('DText', 'center')
    setTextSize('DText', 25)
    addLuaText('DText')

    dialougeNum = 1
    camerah(diaCam[dialougeNum])
    runTimer('type letter', diaDelay[dialougeNum], string.len(diaText[dialougeNum]))
end

function clearDialouge()
    Dialouge = false
    stopSound('dialouge')
    removeLuaSprite('box', false)
    removeLuaText('charName', false)
    removeLuaText('DText', false)
    setProperty('inCutscene', false);

    if postsong then
    runTimer('end', 0.1)
    else
    runTimer('start', 1.6)
    end
end

function addDialouge(text, char, delay, point)
    amountOfDia = amountOfDia + 1
    diaText[amountOfDia] = text
    diaChar[amountOfDia] = char
    diaDelay[amountOfDia] = delay
    diaCam[amountOfDia] = point
end

function camerah(kami)
    
    if kami == 'dad' then
        --setProperty('camFollowPos.x', 400)
        --setProperty('camFollowPos.y', 500)
        doTweenX('xfindshisvalue', 'camFollowPos', 550, 1, 'circInOut')
        doTweenY('yrudoingthis', 'camFollowPos', 500, 1, 'circInOut')
    elseif kami == 'bf' then
        --setProperty('camFollowPos.x', 1000)
        --setProperty('camFollowPos.y', 500)
        doTweenX('xfindshisvalue', 'camFollowPos', 1000, 1, 'circInOut')
        doTweenY('yrudoingthis', 'camFollowPos', 520, 1, 'circInOut')
    elseif kami == 'gf' then
        --setProperty('camFollowPos.x', 600)
        --setProperty('camFollowPos.y', 300)
        doTweenX('xfindshisvalue', 'camFollowPos', 650, 1, 'circInOut')
        doTweenY('yrudoingthis', 'camFollowPos', 300, 1, 'circInOut')
    end
end