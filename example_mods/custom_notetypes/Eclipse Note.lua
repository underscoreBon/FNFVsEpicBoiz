function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Eclipse Note' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'noteskins/WhiteNote'); --Change texture
			setPropertyFromGroup('unspawnNotes', i, 'noteSplashDisabled', true);
			setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true);
            setPropertyFromGroup('unspawnNotes', i, 'hitCausesMiss', false);
			setPropertyFromGroup('unspawnNotes', i, 'hitHealth', '-0.5'); --Default value is: 0.023, health gained on hit
			setPropertyFromGroup('unspawnNotes', i, 'missHealth', '0'); --Default value is: 0.0475, health lost on miss
			setPropertyFromGroup('unspawnNotes', i, 'noAnimation', true);
		end
	end
end

function goodNoteHit(id, noteData, noteType, isSustainNote)
	if noteType == 'Eclipse Note' then
        addScore(-10)
		playSound('swordslash', 0.3);
		characterPlayAnim('boyfriend', 'hurt', true);
    end
end