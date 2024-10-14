
local hud = {'iconP1','iconP2','healthBar','scoreTxt','timeBar','timeTxt','healthBarBg', 'numScore'}
function onEvent(name, value1, value2)

	Time = tonumber(value1)
	Alpha = tonumber(value2)
	
    if name == 'Hud Fade' then
		for i, hudAlpha in pairs(hud) do --repeats i amount of times.
			doTweenAlpha('tween'..i, hudAlpha, Alpha, Time, 'QuadOut')
		end
end

end
function onStepHit()
	if curStep >= 1168 then
		hud = {'iconP1','iconP2','healthBar','scoreTxt','timeBar','timeTxt','healthBarBg','numScore','healthGainLost'}
	end
end