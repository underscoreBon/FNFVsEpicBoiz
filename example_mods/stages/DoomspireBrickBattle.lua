function onCreate()
	-- background shit
	
	makeLuaSprite('1', 'Doomspire/doomspiresky', -800, -500);
	setScrollFactor('1', 0.8, 0.8);
	scaleObject('1', 2, 2);
	addLuaSprite('1', false);

	makeLuaSprite('2', 'Doomspire/doomspiretower', -650, -1800);
	setScrollFactor('2', 1, 1);
	scaleObject('2', 1, 1);
	addLuaSprite('2', false);

	makeLuaSprite('3', 'Doomspire/doomspirefloor', -1000, -180);
	setScrollFactor('3', 1, 1);
	scaleObject('3', 1.5, 1.5);
	addLuaSprite('3', false);

	close(true);
end