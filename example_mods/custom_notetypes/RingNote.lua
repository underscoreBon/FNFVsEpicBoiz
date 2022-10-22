function onCreate()
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'RingNote' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'specialring'); -- texture path
			setPropertyFromGroup('unspawnNotes', i, 'noteSplashDisabled', true); --no note splashes
			setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true);
			setPropertyFromGroup('unspawnNotes', i, 'mustPress', false); 
			setPropertyFromGroup('unspawnNotes', i, 'copyAlpha', false); 
			setPropertyFromGroup('unspawnNotes', i, 'copyX', false);  
			--setPropertyFromGroup('unspawnNotes', i, 'copyY', false);  
			setPropertyFromGroup('unspawnNotes', i, 'noteData', 0); -- ITS ALWAYS A DAD RIGHT NOTE!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
		end
	end
end
