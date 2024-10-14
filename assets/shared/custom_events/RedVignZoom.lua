function onEvent(name, value1, value2)
	if name == 'RedVignZoom' then
		if value1 == nil then
			value1 = 0.015
		end
		if value2 == nil then
			value2 = 0.03
		end
		makeLuaSprite('redvign','greenhillzone/angelisland/redvignette',0,0)
		scaleObject('redvign', 4.0, 4.0);
		addLuaSprite('redvign')
		setObjectCamera('redvign','hud')
		screenCenter('redvign','x')
		setProperty('redvign.alpha',1)
		doTweenAlpha('removeRedVign','redvign',0,.3)
		triggerEvent('Add Camera Zoom', value1, value2)
	end
end

function onTweenCompleted(tag)
	if tag == 'removeRedVign' then
		removeLuaSprite('redvign')
	end
end