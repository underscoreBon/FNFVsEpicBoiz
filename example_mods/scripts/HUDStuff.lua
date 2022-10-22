
function onUpdatePost()
    --changePresence('I see you like looking at Discord RPC', 'How smart of you... LEAKER.', '', false)
    if not getProperty('inCutscene') then
    setProperty('timeTxt.alpha', 0)
    setProperty('timer.alpha', getProperty('timeBar.alpha'))

    local timeElapsed = math.floor(getProperty('songTime')/1000) -- I stole this from SaraHUD
    local timeTotal = math.floor(getProperty('songLength')/1000)
    
    local timeElapsedFixed = string.format("%.2d:%.2d", timeElapsed/60%60, timeElapsed%60)
    local timeTotalFixed = string.format("%.2d:%.2d", timeTotal/60%60, timeTotal%60)

    if getPropertyFromClass('ClientPrefs', 'timeBarType') == 'Disabled' then
    setTextString('timer','')
    else
    setTextString('timer','[ ' ..timeElapsedFixed .. ' / ' .. timeTotalFixed.. ' ]') 
    end
    else 
    setTextString('timer','')
    end

    if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.SEVEN') then
        if week == 'yo this is fire' then -- gets the Eweek1 old week
            loadSong('Standing There I Realize', 'standard') -- song from metal gear revengence
            setPropertyFromClass('PlayState', 'chartingMode', false)
        end
        if songName == 'Triple EpicBoiz' or songName == 'Exploitation' then -- gets Triple EpicBoiz or exploitation for an infinite loop!
            loadSong('Exploitation', 'standard') -- song from Dave And Bambi
            setPropertyFromClass('PlayState', 'chartingMode', false)
        end
    end

    if songName == 'Exploitation' then
        setTextString('scoreTxt', 'Score: '..score * math.random(1,3)..' | Misses: '..misses * math.random(1,3)..' | Rating: [DATA EXPUNGED]')
    end
end

function onSongStart()
    makeLuaText("timer","[ 0:00 / 0:00 ]", 400, getProperty('timeTxt.x'), getProperty('timeTxt.y'))
    setTextSize("timer", 25)
    setTextAlignment("timer", "center")
    setObjectCamera("timer", "hud")
    addLuaText("timer")

    if songName == 'Eclipse' then
    makeLuaText("instr","INSTRUCTIONS:\nPress the [Yellow] Notes\nAvoid the [Black] Notes", 500, 0, 400)

    elseif songName == 'EvilGuest' or songName == 'Grinding' or songName == 'Ncounter' or songName == 'Rocket' or songName == 'Intense' then
    makeLuaText("instr","INSTRUCTIONS:\nPress the [Yellow] Notes", 500, 0, 400)

    elseif songName == 'Triple EpicBoiz' then
    makeLuaText("instr","INSTRUCTIONS:\nPress the [Yellow] Notes\nAvoid the [Black] Notes\nAlso, Press [SPACE] To get Rings!", 500, 0, 400)

    elseif songName == 'Exploitation' then
    makeLuaText("instr","INSTRUCTIONS:\nI suggest... steaming your whole desktop, streamers....", 500, 0, 400)
    else
    makeLuaText("instr","", 1000, 0, 400)
    end
    setTextSize("instr", 18)
    setTextAlignment("instr", "left")
    setObjectCamera("instr", "hud")
    addLuaText("instr")
    runTimer('fadeinglmao', 5)
end

function onCreatePost()
setTransparency()
funnyDiff = getProperty('storyDifficultyText')
makeLuaText("message", ""..songName.." ("..funnyDiff.. ") || FNF: VsEpicBoiz (PE "..version..")", 1000, 0, 700)
setTextSize("message", 15)
setTextAlignment("message", "left")
setObjectCamera("message", "hud")
addLuaText("message")

addCharacterToList('n_bonnie2', 'dad') --  All Modded Characters NEED to be prechached due to Intense Event, Triple EpicBoiz, and Eclipse
addCharacterToList('n_freddy', 'dad')
addCharacterToList('evil', 'dad')
addCharacterToList('evileclipse', 'dad')
addCharacterToList('evileclipse-dark', 'dad')
addCharacterToList('bf-dark', 'boyfriend')
addCharacterToList('bf-blueballed', 'boyfriend')
--the character 'n_bonnie2-pissed' is not in there :skull:
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'fadeinglmao' then
    doTweenAlpha('fadinshsn', 'instr', 0, 1, 'circInOut')
    end
end

function onEndSong()
    if songName == 'Exploitation' then
    os.exit()
    end
end


function onDestroy()
    if songName == 'Exploitation' then
    setPropertyFromClass('openfl.Lib', "application.window.borderless", false)
    setPropertyFromClass('openfl.Lib', "application.window.maximized", false)
    setPropertyFromClass("openfl.Lib", "application.window.width", 1280) -- nice try maximize opt- oops reverting the stuffs
    setPropertyFromClass("openfl.Lib", "application.window.height", 720)
    setTransparency(nil)
    end
end

function onStepHit()
    if curStep == 1280 and songName == 'Exploitation' then
        makeLuaSprite('dark', nil, -2500, -2500)
        makeGraphic('dark', 5000, 5000, '010101')
        setObjectCamera('dark', 'game')
        addLuaSprite('dark', false)
        setObjectOrder('dark', getObjectOrder('gfGroup') - 1)
        setPropertyFromClass('openfl.Lib', "application.window.borderless", true)
        setPropertyFromClass('openfl.Lib', "application.window.maximized", true)
        setTransparency(0x00010101)
    end
end




ffi = require "ffi"


ffi.cdef [[
    typedef int BOOL;
        typedef int BYTE;
        typedef int LONG;
        typedef LONG DWORD;
        typedef DWORD COLORREF;
    typedef unsigned long HANDLE;
    typedef HANDLE HWND;
    typedef int bInvert;
        
        HWND GetActiveWindow(void);
        
        LONG SetWindowLongA(HWND hWnd, int nIndex, LONG dwNewLong);
        
    HWND SetLayeredWindowAttributes(HWND hwnd, COLORREF crKey, BYTE bAlpha, DWORD dwFlags);
        
        DWORD GetLastError();
]]

function setTransparency(color)
    local win = ffi.C.GetActiveWindow()
    
    if win == nil then
        debugPrint('Error finding window!!! idiot!!!!')
        debugPrint('cool code: '..tostring(ffi.C.GetLastError()))
    end
    if ffi.C.SetWindowLongA(win, -20, 0x00080000) == 0 then
        debugPrint('error setting window to be layed WTF DFOES THAT EVBEN MEAN LMAOOO!!! IM NOT NO NERD!')
        debugPrint('cool code: '..tostring(ffi.C.GetLastError()))
    end
    if ffi.C.SetLayeredWindowAttributes(win, color, 0, 0x00000001) == 0 then
        debugPrint('error setting color key or whatever')
        debugPrint('cool code: '..tostring(ffi.C.GetLastError()))
    end
end