function onCreate()

	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Warning Note' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'noteskins/WARNINGNOTE_assets'); --Change texture
			setPropertyFromGroup('unspawnNotes', i, 'hitHealth', '0.01'); --Default value is: 0.023, health gained on hit
			setPropertyFromGroup('unspawnNotes', i, 'missHealth', '1'); --Default value is: 0.0475, health lost on miss
			setPropertyFromGroup('unspawnNotes', i, 'noteSplashHue', '0');
			setPropertyFromGroup('unspawnNotes', i, 'noteSplashSat', '-20');
			setPropertyFromGroup('unspawnNotes', i, 'noteSplashBrt', '1');
			setPropertyFromGroup('unspawnNotes', i, 'noAnimation', true);
		end
	end
end

function goodNoteHit(id, direction, noteType, isSustainNote)
	if noteType == 'Warning Note' then
		if dadName == 'n_freddy' or dadName == 'n_freddy-flipped' then
        playSound('explode', 0.1);
		else
		playSound('swordslash', 1);
		end
		triggerEvent('Play Animation', 'dodge', 'bf')
		triggerEvent('Play Animation', 'attack', 'dad')
    end
end

function noteMiss(id, direction, noteType, isSustainNote)
	if noteType == 'Warning Note' then
		if dadName == 'n_freddy' or dadName == 'n_freddy-flipped' then
			playSound('explode', 0.1);
			else
				playSound('swordslash', 1);
			end
		triggerEvent('Play Animation', 'hurt', 'bf')
		triggerEvent('Play Animation', 'attack', 'dad')
	end
end
