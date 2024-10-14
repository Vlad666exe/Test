function onCreatePost()
	precacheImage('greenhillzone/angelisland/blackthing')
	makeLuaSprite('glitchShader')
	makeLuaSprite('glitchShaderBlack','greenhillzone/angelisland/blackthing',-500,-400)
	addLuaSprite('glitchShaderBlack')
	scaleObject('glitchShaderBlack',2,2)
	setObjectCamera('glitchShaderBlack','camGame')
	setObjectOrder('glitchShaderBlack',getObjectOrder('dad')+60)
	setProperty('glitchShaderBlack.alpha',0)
    runHaxeCode([[
        var shaderName = 'glitch';
       
        game.initLuaShader(shaderName);
        var shader0 = game.createRuntimeShader(shaderName);
		//FlxG.game.setFilters([new ShaderFilter(shader0)]);
        game.getLuaObject('glitchShader').shader = shader0; // setting it into temporary sprite so luas can set its shader uniforms/properties
		
		
        var shaderName2 = 'glitch2';
       
        game.initLuaShader(shaderName2);
        var shader1 = game.createRuntimeShader(shaderName2);
		//FlxG.game.setFilters([new ShaderFilter(shader1)]);
        game.getLuaObject('glitchShaderBlack').shader = shader1; // setting it into temporary sprite so luas can set its shader uniforms/properties
		
		game.camGame.setFilters([new ShaderFilter(game.getLuaObject('glitchShaderBlack').shader),new ShaderFilter(game.getLuaObject('glitchShader').shader)]);
        return;
    ]])
	setSpriteShader('glitchShaderBlack','glitch2')
	setShaderFloat('glitchShader', 'amount',0)
	setShaderFloat('glitchShader', 'SPEED',10)
	setShaderFloat('glitchShader', 'iTime',1)
	setShaderFloat('glitchShaderBlack', 'iTime',0)
	setShaderFloat('glitchShaderBlack', 'amount',0)
	setShaderFloat('glitchShaderBlack', 'speed',0)
end

function onEvent(n, v1, v2)
	if n == 'tooSlowEvents' then
		if v1 == 'stopglitchshader' then
			removeLuaSprite('glitchShaderBlack')
		end
	end
    if n == 'glitchShader' and getPropertyFromClass('backend.ClientPrefs','data.shaders') == true then
		if getProperty('glitchShaderBlack.alpha') == 1 then
		setProperty('glitchShaderBlack.alpha',0)
		else
		setProperty('glitchShaderBlack.alpha',1)
		end
	   local var1 = stringSplit(v1, ",")
          quantityQuantities = tonumber(var1[1])
	      durationQuantities = stepCrochet * (tonumber(var1[2])) / 1000
	      easeQuantities = tonumber(var1[3])
	   local var2 = stringSplit(v2, ",")
          speedAmount = tonumber(var2[1])
	      durationSpeeds = stepCrochet * (tonumber(var2[2])) / 1000
	      speedEasing = tonumber(var2[3])

       if stringEndsWith(easeQuantities, 'in') then 
          easeQuantities:gsub('in', 'In')
       elseif stringEndsWith(easeQuantities, 'inout') then 
          easeQuantities:gsub('inout', 'InOut')
       elseif stringEndsWith(easeQuantities, 'out') then 
          easeQuantities:gsub('out', 'Out')
       end

       if stringEndsWith(speedEasing, 'in') then 
          speedEasing:gsub('in', 'In')
       elseif stringEndsWith(speedEasing, 'inout') then 
          speedEasing:gsub('inout', 'InOut')
       elseif stringEndsWith(speedEasing, 'out') then 
          speedEasing:gsub('out', 'Out')
       end

	   if durationQuantities == 0 then
	      setProperty('glitchShader.x', quantityQuantities)
	   else
	      doTweenX('glitchShaderAmount', 'glitchShader', quantityQuantities, durationQuantities, easeQuantities)
	   end

       if durationSpeeds == 0 then
	      setProperty('glitchShader.y', speedAmount)
	   else
	      doTweenY('glitchShaderSpeed', 'glitchShader', speedAmount, durationSpeeds, speedEasing)
	   end
	end
	if n == 'glitchShader' and getPropertyFromClass('backend.ClientPrefs','data.shaders') == false then
		setObjectCamera('coverstuffhud','camHud')
		setObjectOrder('coverstuffhud',getObjectOrder('somanysoulssonic')-1)
		doTweenAlpha('hudBlackTween','coverstuffhud',1,.5)
	end
end

function stringSplit(str, sep)
    if sep == nil then sep = "%s" end
    local t = {}
    for str in string.gmatch(str, "([^" .. sep .. "]+)") do
        table.insert(t, str)
    end
    return t
end

function onUpdate()
    setShaderFloat('glitchShader', 'iTime', os.clock())
	setShaderFloat('glitchShader', 'amount', getProperty('glitchShader.x'))
	setShaderFloat('glitchShader', 'speed', getProperty('glitchShader.y'))
	setShaderFloat('glitchShaderBlack', 'AMT',11-(getProperty('glitchShader.x')*100))
end

function onDestroy()
    setShaderFloat('glitchShader', 'iTime', 0)
	setShaderFloat('glitchShader', 'amount', 0)
	setShaderFloat('glitchShader', 'speed', 0)
	setShaderFloat('glitchShaderBlack', 'AMT', 0)
end
function onTweenCompleted(tag)
	if tag == 'glitchShaderAmount' then
	removeSpriteShader('glitchShaderBlack','glitch2')
	setProperty('glitchShader.x',0)
	setProperty('glitchShader.y',0)
	end
end