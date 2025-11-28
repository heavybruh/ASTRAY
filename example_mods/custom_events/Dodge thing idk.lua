--[[ Script made by Heavy Bruh ]]

local event_name = 'Dodge thing idk';
local min = 4;
local canDodge = false;

function onCreate()
	if event_name == 'Dodge thing idk' then
		if not hideHud then
			cur_bf_x = getProperty('boyfriend.x');

			makeAnimatedLuaSprite('daspacebar', ('events/misc/')..'Extras', 0, 400);
			addAnimationByPrefix('daspacebar', 'Space press', "Spacebar", 48, false);
			scaleObject('daspacebar', .9, .9);
			setObjectCamera('daspacebar', 'hud');
			setProperty('daspacebar.visible', false);
			setObjectOrder('daspacebar', 2);
			addLuaSprite('daspacebar', true);
	
			makeAnimatedLuaSprite('warning-sign', ('events/misc/')..'warning', 0, getProperty('daspacebar.y')-350);
			addAnimationByPrefix('warning-sign', 'warning-1', 'warning-1', 1, false);
			addAnimationByPrefix('warning-sign', 'warning-2', 'warning-2', 1, false);
			addAnimationByPrefix('warning-sign', 'warning-3', 'warning-3', 1, false);
			addAnimationByPrefix('warning-sign', 'warning-symbol', 'warning-symbol', 1, false);
			scaleObject('warning-sign', .7, .7);
			setObjectCamera('warning-sign', 'hud');
			setProperty('warning-sign.visible', false);
			setObjectOrder('warning-sign', 1);
			addLuaSprite('warning-sign', true);
		end
	end
end

function onBeatHit()
	if curBeat % 1 == 0 then
		objectPlayAnimation('daspacebar', 'Space press', true);

		setProperty('warning-sign.scale.x', .8);
		setProperty('warning-sign.scale.y', .8);
		doTweenX('warning-sign-scale-x', 'warning-sign.scale', .7, (curBpm/500), 'sineOut');
		doTweenY('warning-sign-scale-y', 'warning-sign.scale', .7, (curBpm/500), 'sineOut');

		if canDodge == true then
			characterPlayAnim('boyfriend', 'pre-attack', true);
			playSound('Metronome_Tick', 1, 'Parry thing idk');
			min = min - 1;
			playAnim('warning-sign', 'warning-'..min, true, false, 0);
		elseif min == 0 then
			setProperty('health', (getProperty('health')-.5));
		end
	end
end

function onEvent(name)
	if name == event_name then
		canDodge = true;

		setProperty('warning-sign.visible', true);
		setProperty('daspacebar.visible', true);
	end
end

function onUpdate(elapsed)
	screenCenter('daspacebar', 'x');
	screenCenter('warning-sign', 'x');

	if min == 1 and keyJustPressed('space') then
		onDodgeEvent(true);
	end

	if min == 0 then
		onDodgeEvent(false);
	end
end

function onDodgeEvent(outcome)
	if outcome == true then
		canDodge = false;
		min = 4;
		characterPlayAnim('boyfriend', 'attack', true);
		setProperty('dad.color', getColorFromHex('ff0000'));
		doTweenColor('dad-color-white', 'dad', 'ffffff', .3, 'linearInOut');
		playSound('hitsound', .7, 'hitsound');
		setProperty('daspacebar.visible', false);
		setProperty('warning-sign.visible', false);
		setProperty('boyfriend.x', getProperty('boyfriend.x')+getProperty('dad.x'));
		doTweenX('bf-attacked', 'boyfriend', cur_bf_x, .5, 'sineOut');
	elseif outcome == false then
		min = 4;
		canDodge = false;
		setProperty('health', (getProperty('health')-.5))
		characterPlayAnim('boyfriend', 'hurt', true);
		setProperty('boyfriend.color', getColorFromHex('ff0000'));
		doTweenColor('bf-color-white', 'boyfriend', 'ffffff', .3, 'linearInOut');
		setProperty('daspacebar.visible', false);
		setProperty('warning-sign.visible', false);
	elseif outcome == nil then
		debugPrint("fuck")
	end
end