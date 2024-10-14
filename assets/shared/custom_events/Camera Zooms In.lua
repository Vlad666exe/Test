local Time = 0
local Zoom = 0

function onEvent(n,v1,v2)
	if n == 'Camera Zooms In' then
		
		Time = tonumber(v1)
		Zoom = tonumber(v2)
		
		doTweenZoom('zooooom','camGame',Zoom,Time,'quadIn')
	end
end

function onTweenCompleted(tag)
	if tag == 'zooooom' then
		setProperty('defaultCamZoom', Zoom)
	end
end