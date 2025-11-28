--[[ Script made by Heavy Bruh ]]

local event_name = 'Bloom Bop Effect';

function onCreate()
	if (not hideHud) then
		makeLuaSprite('bloom', nil, nil, nil)
		makeGraphic('bloom', screenWidth, screenHeight, 'ffffff')
		setObjectCamera('bloom', 'hud')
		setProperty('bloom.alpha', 0)
		setBlendMode('bloom', 'add')
		addLuaSprite('bloom')
	end
end

function onEvent(name, value1)
	if (name == event_name) then
		setProperty('bloom.alpha', value1)
		alpha_tween = doTweenAlpha('bloom=alpha', 'bloom', 0, (crochet / 1000), 'linear')
	end
end
