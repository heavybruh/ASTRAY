--[[ Script made by Heavy Bruh :D ]]

local function cameraSetPostition(x, y)
	setProperty('camFollowPos.x', x)
    setProperty('camFollowPos.y', y)
end

function onCreate()
	local hud_assets = {'healthBarBG', 'healthBar', 'scoreTxt', 'iconP1', 'iconP2', 'botplayTxt'}
	local border_y_offset = 150;

    setProperty('skipCountdown', true)

	setProperty('camNoteMoveOffset', 20)
	cameraSetPostition(600, 980)

    setProperty('camGame.height', getProperty('camGame.height') - border_y_offset);
	setProperty('camGame.y', (getProperty('camGame.y') + (border_y_offset / 2)));

    for i = 1, #hud_assets do
        setProperty(hud_assets[i] .. '.visible', false)
    end
end

function onEvent(eventName)
    if (eventName == 'Add Camera Zoom') then
		triggerEvent('Bloom Bop Effect', 0.2, 0)
    end
end