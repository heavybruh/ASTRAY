
local alley_assets_dir = ('stages/alley/')

function onCreate()
	makeLuaSprite('city-sky', alley_assets_dir..'city-sky', nil, nil);
	scaleObject('city-sky', 1.5, 1.5)
	screenCenter('city-sky', 'xy')

	makeLuaSprite('buildings-bg', alley_assets_dir..'buildings-bg', getProperty('city-sky.x'), getProperty('city-sky.y'));
	scaleObject('buildings-bg', getProperty('city-sky.scale.x'), getProperty('city-sky.scale.y'));

	makeLuaSprite('floor', alley_assets_dir..'floor', getProperty('city-sky.x'), getProperty('city-sky.y'));
	scaleObject('floor', getProperty('city-sky.scale.x'), getProperty('city-sky.scale.y'));

	makeLuaSprite('buildings', alley_assets_dir..'buildings', getProperty('city-sky.x'), getProperty('city-sky.y'));
	scaleObject('buildings', getProperty('city-sky.scale.x'), getProperty('city-sky.scale.y'));

	addLuaSprite('city-sky');
	addLuaSprite('buildings-bg');
	addLuaSprite('floor');
	addLuaSprite('buildings');

	close(true);
end