function onCreate()
	-- background shit
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
end

function onEvent(name, value1, value2)
	if name == 'shitty ass hfjONE reference' then -- sorry non object show fans
	if value1 == '1' then
		triggerEvent('Change Character', 'bf', 'bf-dark')
		triggerEvent('Change Character', 'dad', 'evileclipse-dark')
		setProperty('gf.alpha', 0)
    setProperty('1a.visible', false)
	setProperty('2a.visible', false)
	setProperty('3b.visible', false)
	setProperty('3a.visible', false)

	setProperty('1ad.visible', true)
	setProperty('2ad.visible', true)
	setProperty('3bd.visible', true)
	setProperty('3ad.visible', true)
	elseif value1 == '0' then
		triggerEvent('Change Character', 'bf', 'bf')
		triggerEvent('Change Character', 'dad', 'evileclipse')
		setProperty('gf.alpha', 1)
	setProperty('1a.visible', true)
	setProperty('2a.visible', true)
	setProperty('3b.visible', true)
	setProperty('3a.visible', true)
	
	setProperty('1ad.visible', false)
	setProperty('2ad.visible', false)
	setProperty('3bd.visible', false)
	setProperty('3ad.visible', false)
	    end
	end
end