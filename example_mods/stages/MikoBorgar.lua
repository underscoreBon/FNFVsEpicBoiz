function onCreatePost()
	-- background shit
	
	makeLuaSprite('miko', 'MikoBorgar/MikoSky', -800, -500);
	setScrollFactor('miko', 0.8, 0.8);
	scaleObject('miko', 2, 2);
	addLuaSprite('miko', false);

	if not lowQuality then
		makeLuaSprite('miko1', 'MikoBorgar/MikoBuildings', -700, -900);
		setScrollFactor('miko1', 1, 1);
		scaleObject('miko1', 1, 1);
		addLuaSprite('miko1', false);
	end

	makeLuaSprite('miko2', 'MikoBorgar/MikoBack', -650, -1200);
	setScrollFactor('miko2', 1, 1);
	scaleObject('miko2', 1, 1);
	addLuaSprite('miko2', false);

	makeLuaSprite('miko3', 'MikoBorgar/MikoGround', -700, -950);
	setScrollFactor('miko3', 1, 1);
	scaleObject('miko3', 1, 1);
	addLuaSprite('miko3', false);

	setProperty('gf.alpha', 0)
	close(false);
end