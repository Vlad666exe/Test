function onCreatePost()
    makeLuaSprite('icon2-lose', 'icons/faker-peek', 0, 0)
    makeLuaSprite('icon2-norm', 'icons/faker-norm', 0, 0)
    scaleObject('icon2-lose', 1, 1) --change the values if the icon is too big or small
    scaleObject('icon2-norm', 1, 1) --change the values if the icon is too big or small
    setObjectCamera('icon2-lose', 'hud')
    setObjectCamera('icon2-norm', 'hud')
    setObjectOrder('icon2-norm', getObjectOrder('iconP2')+50)
    setObjectOrder('icon2-lose', getObjectOrder('iconP2')+51)
    setProperty('iconP2.alpha', 0)
    addLuaSprite('icon2-lose')
    addLuaSprite('icon2-norm')
	makeLuaSprite('icon1-lose', 'icons/bf-lose', 0, 0)
    makeLuaSprite('icon1-norm', 'icons/bf-norm', 0, 0)
    scaleObject('icon1-lose', 1, 1) --change the values if the icon is too big or small
    scaleObject('icon1-norm', 1, 1) --change the values if the icon is too big or small
    setObjectCamera('icon1-lose', 'hud')
    setObjectCamera('icon1-norm', 'hud')
    setObjectOrder('icon1-lose', getObjectOrder('iconP1')+50)
    setObjectOrder('icon1-norm', getObjectOrder('iconP1')+50)
    setProperty('iconP1.alpha', 0)
	setProperty('icon1-lose.flipX',true)
	setProperty('icon1-norm.flipX',true)
    addLuaSprite('icon1-lose')
    addLuaSprite('icon1-norm')
    setProperty('icon2-lose.alpha', 0)
	initLuaShader('iconglitch')
	setSpriteShader('icon2-lose','iconglitch')
    setProperty('icon1-norm.alpha', 0)
    setProperty('icon1-lose.alpha', 0)
    setProperty('icon2-norm.alpha', 0)
end
local iconalpha = {'icon1-norm', 'icon2-norm','healthBar','healthBarBG', 'scoreTxt'}
function onUpdate()
	if stopShader == true then
	else
		setShaderFloat('icon2-lose', 'iTime', os.clock())
	end
    setProperty('icon2-lose.x', getProperty('iconP2.x'))
    setProperty('icon2-norm.y', getProperty('iconP2.y'))
    setProperty('icon2-lose.y', getProperty('iconP2.y'))
    setProperty('icon2-norm.x', getProperty('iconP2.x'))
    setProperty('icon1-lose.x', getProperty('iconP1.x'))
    setProperty('icon1-norm.y', getProperty('iconP1.y'))
    setProperty('icon1-lose.y', getProperty('iconP1.y'))
    setProperty('icon1-norm.x', getProperty('iconP1.x'))
    if getHealth() <= 0.15 then
        setProperty('icon1-norm.alpha', 0)
        setProperty('icon1-lose.alpha', 1)
        setProperty('icon2-norm.alpha', 1)
    elseif getHealth() >= 1.85 then
        setProperty('icon1-norm.alpha', 1)
        setProperty('icon1-lose.alpha', 0)
        setProperty('icon2-norm.alpha', 1)
    end
	
	
	
end

function onEvent(n, v1, v2)
	if n == 'fakeicon-fade' then
		if v1 ~= 'on' then
			doTweenAlpha('spoopy','icon2-lose',v1,v2)
		elseif v1 == 'on' then
			for i, specAlpha in pairs(iconalpha) do --repeats i amount of times.
				doTweenAlpha('tween'..i, specAlpha, 1, 2.7)
			end
		end
		if v1 == 'remove' then
			onDestroy()
			stopShader = true
			removeLuaSprite('icon1-norm',true)
			removeLuaSprite('icon1-lose',true)
			removeLuaSprite('icon2-norm',true)
			removeLuaSprite('icon2-lose',true)
		end
	end
end
local temp = onDestroy
    function onDestroy()
        runHaxeCode([[
            FlxG.signals.gameResized.remove(fixShaderCoordFix);
            return;
        ]])
        if (temp) then temp() end
    end