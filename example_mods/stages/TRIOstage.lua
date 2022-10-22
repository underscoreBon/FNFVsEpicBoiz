function onCreatePost()
	-- background shit

	--[[ MIKO ]]--

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

	--[[ DOOMSPIRE ]]--

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

	--[[ SFOTH ]]--
	makeLuaSprite('1ad', 'HeightsDark/SFOTHSky', -800, -500);
	setScrollFactor('1ad', 0.8, 0.8);
	scaleObject('1ad', 2, 2);
	addLuaSprite('1ad', false);

	makeLuaSprite('2ad', 'HeightsDark/SFOTHBars', 200, -300);
	setScrollFactor('2ad', 0.7, 0.7);
	scaleObject('2ad', 1, 1);
	addLuaSprite('2ad', false);

	makeLuaSprite('3bd', 'HeightsDark/SFOTHFloor', -400, 200);
	setScrollFactor('3bd', 0.9, 0.9);
	scaleObject('3bd', 1, 1);
	addLuaSprite('3bd', false);

	makeLuaSprite('3ad', 'HeightsDark/SFOTHFront', -300, 650);
	setScrollFactor('3ad', 0.8, 0.8);
	scaleObject('3ad', 1, 1);
	addLuaSprite('3ad', true);

	makeLuaSprite('1a', 'Heights/SFOTHSky', -800, -500);
	setScrollFactor('1a', 0.8, 0.8);
	scaleObject('1a', 2, 2);
	addLuaSprite('1a', false);

	makeLuaSprite('2a', 'Heights/SFOTHBars', 200, -300);
	setScrollFactor('2a', 0.7, 0.7);
	scaleObject('2a', 1, 1);
	addLuaSprite('2a', false);

	makeLuaSprite('3b', 'Heights/SFOTHFloor', -400, 200);
	setScrollFactor('3b', 0.9, 0.9);
	scaleObject('3b', 1, 1);
	addLuaSprite('3b', false);

	makeLuaSprite('3a', 'Heights/SFOTHFront', -300, 650);
	setScrollFactor('3a', 0.8, 0.8);
	scaleObject('3a', 1, 1);
	addLuaSprite('3a', true);

	setProperty('1ad.visible', false)
	setProperty('2ad.visible', false)
	setProperty('3bd.visible', false)
	setProperty('3ad.visible', false)
	setProperty('1a.visible', false)
	setProperty('2a.visible', false)
	setProperty('3b.visible', false)
	setProperty('3a.visible', false)
	setProperty('1.visible', false)
	setProperty('2.visible', false)
	setProperty('3.visible', false)
	setProperty('miko.visible', true)
	setProperty('miko1.visible', true)
	setProperty('miko2.visible', true)
	setProperty('miko3.visible', true)

	setProperty('gf.alpha', 0) --  gf begone
end

function onEvent(name, value1, value2)
	if name == 'tripleepicboiz' then
		if value1 == '0' then
		repositionChars(100, 100, 900, 100, 0.6)
		setProperty('1ad.visible', false)
		setProperty('2ad.visible', false)
		setProperty('3bd.visible', false)
		setProperty('3ad.visible', false)
		setProperty('1a.visible', false)
		setProperty('2a.visible', false)
		setProperty('3b.visible', false)
		setProperty('3a.visible', false)
		setProperty('1.visible', false)
		setProperty('2.visible', false)
		setProperty('3.visible', false)
		setProperty('miko.visible', true)
		setProperty('miko1.visible', true)
		setProperty('miko2.visible', true)
		setProperty('miko3.visible', true)
	elseif value1 == '1' then
	--repositionChars(50, 100, 900, 100, 0.85)
	repositionChars(900, 100, 50, 100, 0.85)
	setProperty('1ad.visible', false)
	setProperty('2ad.visible', false)
	setProperty('3bd.visible', false)
	setProperty('3ad.visible', false)
	setProperty('1a.visible', false)
	setProperty('2a.visible', false)
	setProperty('3b.visible', false)
	setProperty('3a.visible', false)
	setProperty('1.visible', true)
	setProperty('2.visible', true)
	setProperty('3.visible', true)
	setProperty('miko.visible', false)
	setProperty('miko1.visible', false)
	setProperty('miko2.visible', false)
	setProperty('miko3.visible', false)
    elseif value1 == '2' then
	repositionChars(100, 50, 900, 50, 0.8)
	setProperty('1ad.visible', false)
	setProperty('2ad.visible', false)
	setProperty('3bd.visible', false)
	setProperty('3ad.visible', false)
	setProperty('1a.visible', true)
	setProperty('2a.visible', true)
	setProperty('3b.visible', true)
	setProperty('3a.visible', true)
	setProperty('1.visible', false)
	setProperty('2.visible', false)
	setProperty('3.visible', false)
	setProperty('miko.visible', false)
	setProperty('miko1.visible', false)
	setProperty('miko2.visible', false)
	setProperty('miko3.visible', false)
    elseif value1 == '3' then
	repositionChars(100, 50, 900, 50, 0.8)
	setProperty('1ad.visible', true)
	setProperty('2ad.visible', true)
	setProperty('3bd.visible', true)
	setProperty('3ad.visible', true)
	setProperty('1a.visible', false)
	setProperty('2a.visible', false)
	setProperty('3b.visible', false)
	setProperty('3a.visible', false)
	setProperty('1.visible', false)
	setProperty('2.visible', false)
	setProperty('3.visible', false)
	setProperty('miko.visible', false)
	setProperty('miko1.visible', false)
	setProperty('miko2.visible', false)
	setProperty('miko3.visible', false)
    elseif value1 == '4' then
	setProperty('1ad.visible', false)
	setProperty('2ad.visible', false)
	setProperty('3bd.visible', false)
	setProperty('3ad.visible', false)
	setProperty('1a.visible', false)
	setProperty('2a.visible', false)
	setProperty('3b.visible', false)
	setProperty('3a.visible', false)
	setProperty('1.visible', false)
	setProperty('2.visible', false)
	setProperty('3.visible', false)
	setProperty('miko.visible', false)
	setProperty('miko1.visible', false)
	setProperty('miko2.visible', false)
	setProperty('miko3.visible', false)
end
end
end

function repositionChars(dx,dy,bx,by,zoom)
	setCharacterX('dad', dx)
	setCharacterY('dad', dy)
	setCharacterX('bf', bx)
	setCharacterY('bf', by)
	setProperty('defaultCamZoom', zoom)
end