function onCreatePost()
	makeLuaSprite('dadspotlight', 'greenhillzone/angelisland/spotlight',0,0)
	makeLuaSprite('bfspotlight', 'greenhillzone/angelisland/spotlight',0,0)
end

function onEvent(n,v1,v2)
	if n == 'sufferingsiblings' then
		if v1 == '' then
			addLuaSprite('dadspotlight')
			addLuaSprite('bfspotlight')
			setProperty('coverstuffhud.alpha',1)
			setObjectCamera('coverstuffhud','camGame')
			setObjectOrder('coverstuffhud',getObjectOrder('dedgrass')+9)
			setObjectOrder('coverstuffhud',getObjectOrder('bfspotlight')-2)
			scaleObject('bfspotlight',.9,.9)
			setProperty('dadspotlight.y',getProperty('dad.y')*3.15)
			setProperty('dadspotlight.x',getProperty('dad.x')*1.85)
			setProperty('bfspotlight.y',getProperty('boyfriend.y')*1.3)
			setProperty('bfspotlight.x',getProperty('boyfriend.x')*.65)
			setProperty('gf.alpha',0)
		end
		if v1 == 'remove' then
			removeLuaSprite('bfspotlight',true)
			removeLuaSprite('dadspotlight',true)
			setProperty('coverstuffhud.alpha',0)
			setProperty('gf.alpha',1)
		end
	end
end