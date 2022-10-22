
--[[Triple Trouble Ring in .lua]]--

-- Script and Pixel Ring Sprites by: n_bonnie2
-- Tails Get Trolled Crosshair Script (for template) by: heat_ on gamebanana
-- Mechanic and Regular Ring sprites from: The FNF: Vs Sonic.exe Mod 

-- USE WITH CREDIT, or if you choose to not to credit, keep the comments

-- use "triggerEvent('Toggle Ring Mechanic', false, nil)" in order to activated in a script
-- i dont blame you for not reading the README.txt lmao

-- i know this is messy, im a messy person

---------------------------------------------------------------------------------------


local defaultNotePos = {}
HitRing = false
ringpos = {}
ringoffsets = {}
rings = 0
ringmechanic = false
swapped = false


function onCreatePost()

    isPixel = getPropertyFromClass('PlayState', 'isPixelStage')
    if middlescroll and not downscroll then
        ringpos = {580, 50}
    end
    if middlescroll and downscroll then
        ringpos = {580, screenHeight - 150}
    end
    if not middlescroll and not downscroll then
        ringpos = {900, 50}
    end
    if not middlescroll and downscroll then
        ringpos = {900, screenHeight - 150}
    end

    ringoffsets = {0, 0}

    if not isPixel then 
    makeAnimatedLuaSprite('strumring', 'ring', ringpos[1], ringpos[2]);
    else
    makeAnimatedLuaSprite('strumring', 'pixelUI/ring', ringpos[1], ringpos[2]);
    end

    setObjectCamera('strumring', 'hud')

    if isPixel then 
    frames = 12
    setProperty('strumring.antialiasing', false)
    scaleObject('strumring', 0.7 * (1 / 0.7) * 6, 0.7 * (1 / 0.7) * 6);
    else
    frames = 24
	scaleObject('strumring', 0.7, 0.7);
    end

	addLuaSprite('strumring', false);

    addAnimationByPrefix('strumring', 'strum', 'arrowSPACE', frames, false)
    addAnimationByPrefix('strumring', 'press', 'space press', frames, false)
    addAnimationByPrefix('strumring', 'glow', 'space confirm', frames, false)

    setProperty('strumring.alpha', 0)
    objectPlayAnimation('strumring', 'strum', true)
end


function onCountdownTick(counter)
	if counter == 2 then
        if songName == 'Triple EpicBoiz' then -- well its your song
        triggerEvent('Toggle Ring Mechanic', true, nil)
        else
        triggerEvent('Toggle Ring Mechanic', false, nil)
        end
    end
end

function onSongStart()
    if songName == 'Triple EpicBoiz' then -- well its your song
        triggerEvent('Toggle Ring Mechanic', true, nil)
        else
        triggerEvent('Toggle Ring Mechanic', false, nil)
    end
end

function onUpdate(elapsed)
    setTextString('rings', rings)
    updateOffsets()
    if not HitRing then
    if keyJustPressed('space') then
        objectPlayAnimation('strumring', 'press', true)
        HitRing = false
        updateOffsets()
        end
    end

    if keyReleased('space') then
        objectPlayAnimation('strumring', 'strum', true)
        HitRing = false
        updateOffsets()
    end
end

function onUpdatePost(elapsed)
	for i = 0, getProperty('notes.length')-1 do
		if getPropertyFromGroup('notes', i, 'noteType') == 'RingNote' then

            Noffset1 = defaultOpponentStrumY0 - getPropertyFromGroup('strumLineNotes', 0, 'y') 
            Noffset2 = ringpos[2] - getProperty('strumring.y')

            hehe = Noffset1 - Noffset2 + getPropertyFromGroup('notes', i, 'y') -- properly positions the note rather than using the dad's right note ypos
            setPropertyFromGroup('notes', i, 'y', hehe)

			if getPropertyFromGroup('notes', i, 'strumTime') - getPropertyFromClass('Conductor', 'safeZoneOffset') * 0.7 < getSongPosition() then
				if keyJustPressed('space') and not getProperty('boyfriend.stunned') or botPlay then 
					HitRing = true
					objectPlayAnimation('strumring', 'glow', true)
                    updateOffsets()
					Hit(i);
				end
			end

			if getSongPosition() > getPropertyFromGroup('notes', i, 'strumTime') + (350 / getProperty('songSpeed')) then
				Miss(i);
			end
			setPropertyFromGroup('notes', i, 'alpha', getPropertyFromGroup('playerStrums', 0, 'alpha')); 
			setPropertyFromGroup('notes', i, 'x', getProperty('strumring.x')); -- the x finds its value lmaoooo
            if getPropertyFromGroup('notes', i, 'noteType') == 'RingNote' then
            setPropertyFromGroup('notes', i, 'texture', 'specialring'); -- idk if it fixes that visual bug when the ring turns into a note
            end
        end
 	end
end


-- Hit and miss ring functions
function Hit(id)
    rings = rings + 1
    playSound('Ring', 0.5);
	setPropertyFromGroup('notes', id, 'visible', false); 
	setPropertyFromGroup('notes', id, 'active', false); 
    if getPropertyFromGroup('notes', id, 'noteType') == 'RingNote' then
        setPropertyFromGroup('notes', id, 'texture', 'specialring'); -- idk if it fixes that visual bug when the ring turns into a note
        end
	removeFromGroup('notes', id, false);
end

function Miss(id)
	setPropertyFromGroup('notes', id, 'visible', false); 
	setPropertyFromGroup('notes', id, 'active', false); 
    if getPropertyFromGroup('notes', id, 'noteType') == 'RingNote' then
        setPropertyFromGroup('notes', id, 'texture', 'specialring'); -- idk if it fixes that visual bug when the ring turns into a note
        end
	removeFromGroup('notes', id, false);
end


-- Should i do "missHealth???"
function noteMiss()
    if rings > 0 then
        if misses > 0 then
        addMisses(-1)
        setProperty('health', getProperty('health') + 0.0475)
        end
        rings = rings -1
    end
end


-- Mechanic Activating Function!!!!
function ringMech(bool)
    if bool == true then
        if not ringmechanic then
        ringmechanic = true
        if not downscroll then
            makeLuaText("rings","0", 1000, 1200, 600)
            else
            makeLuaText("rings","0", 1000, 1200, 0)
            end
            setTextSize("rings", 75)
            setTextAlignment("rings", "left")
            setObjectCamera("rings", "hud")
            setTextColor('rings', 'fbff00')
            setTextFont('rings', 'sonc.ttf')
            setTextBorder('rings', '4', 'ffbb00')
            addLuaText("rings")
        if not downscroll then
            makeLuaSprite('counter', 'Counter', 1120, 610);
            else
            makeLuaSprite('counter', 'Counter', 1120, 10);
            end
            setObjectCamera('counter', 'hud')
            scaleObject('counter', 1, 1);
            addLuaSprite('counter', false);
    doTweenAlpha('funny1', 'strumring', 1, 0.5, 'circInOut') -- funny tween
    for i = 4, 5 do
        noteTweenX('funnynote'..i..'', i, getPropertyFromGroup('strumLineNotes', i, 'x') - 56, 0.5, 'circInOut')
    end
    for i = 6, 7 do
        noteTweenX('funnynote'..i..'', i, getPropertyFromGroup('strumLineNotes', i, 'x') + 56, 0.5, 'circInOut')
    end
end
else

    if bool == false then
    if ringmechanic then
    ringmechanic = false
    doTweenAlpha('funny1', 'strumring', 0, 0.5, 'circInOut') -- funny tween
    for i = 4, 5 do
        noteTweenX('funnynote'..i..'', i, getPropertyFromGroup('strumLineNotes', i, 'x') + 56, 0.5, 'circInOut')
    end
    for i = 6, 7 do
        noteTweenX('funnynote'..i..'', i, getPropertyFromGroup('strumLineNotes', i, 'x') - 56 , 0.5, 'circInOut')
    end
    end
    end
    end
end




-- EVENTS SHIT, I cant put them in seperate .lua's because it dont work correctly
-- i know, its messy
function onEvent(n,i,ii)
    if n == 'Toggle Ring Mechanic' then
        if i == 'true' then
            ringMech(true)
        else if i == 'false' then
            ringMech(false)
        end
        end
    end
    if not middlescroll then
        if n == 'Swap Strums' then
        if not swapped then
            swapped = true
            for strums = 0,4 do
                setPropertyFromGroup('playerStrums', strums,'x',92 + (112 * strums))
                setPropertyFromGroup('opponentStrums', strums,'x',732 + (112 * strums))
            end
        if ringmechanic then
            for i = 4, 5 do
                noteTweenX('funnynote'..i..'', i, getPropertyFromGroup('strumLineNotes', i, 'x') - 56, 0.0001, 'circInOut')
            end
            for i = 6, 7 do
                noteTweenX('funnynote'..i..'', i, getPropertyFromGroup('strumLineNotes', i, 'x') + 56, 0.0001, 'circInOut')
            end
            setProperty('strumring.x', 260)
        end
        elseif swapped then
            swapped = false
            for strums = 0,4 do
                setPropertyFromGroup('playerStrums', strums,'x',732 + (112 * strums))
                setPropertyFromGroup('opponentStrums', strums,'x',92 + (112 * strums))
            end
            if ringmechanic then
            for i = 4, 5 do
                noteTweenX('funnynote'..i..'', i, getPropertyFromGroup('strumLineNotes', i, 'x') - 56, 0.0001, 'circInOut')
            end
            for i = 6, 7 do
                noteTweenX('funnynote'..i..'', i, getPropertyFromGroup('strumLineNotes', i, 'x') + 56, 0.0001, 'circInOut')
            end
            setProperty('strumring.x', 900)
               end
            end
        end
     end
end




function updateOffsets()
    if HitRing then
        if not isPixel then
        ringoffsets = {48, 45}
        else
        ringoffsets = {-42, -40}
        end
    else
        if not isPixel then
        ringoffsets = {22, 20}
        else
        ringoffsets = {-42, -40}
        end
    end
setProperty('strumring.offset.x', ringoffsets[1])
setProperty('strumring.offset.y', ringoffsets[2])
end
