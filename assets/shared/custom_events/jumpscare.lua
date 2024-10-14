function onCreatePost()
	makeAnimatedLuaSprite('lefthand', 'greenhillzone/angelisland/exejumpscare-hand', 50, 80)
	addAnimationByPrefix('lefthand', 'pre', 'pre', 24, false)
	addAnimationByPrefix('lefthand', 'post', 'post', 24, false)
	addLuaSprite('lefthand')
	setProperty('lefthand.alpha',0.00001)
	setProperty('lefthand.angle',90)
	makeAnimatedLuaSprite('righthand', 'greenhillzone/angelisland/exejumpscare-hand', 900, 80)
	addAnimationByPrefix('righthand', 'pre', 'pre', 24, false)
	addAnimationByPrefix('righthand', 'post', 'post', 24, false)
	addLuaSprite('righthand')
	makeAnimatedLuaSprite('head', 'greenhillzone/angelisland/exejumpscare-head', 270, -50)
	addAnimationByPrefix('head', 'boo', 'boo', 24, false)
	addLuaSprite('head')
	setProperty('head.alpha',0.00001)
	setProperty('righthand.alpha',0.00001)
	setProperty('righthand.flipX',true)
	setProperty('righthand.angle',270)
	setObjectCamera('lefthand','hud')
	setObjectCamera('righthand','hud')
	setObjectCamera('head','hud')
	makeLuaSprite('jumpscare', '',0,0)
	makeGraphic('jumpscare',screenWidth, screenHeight, '000000')
	addLuaSprite('jumpscare')
	setObjectCamera('jumpscare','hud')
	setProperty('jumpscare.alpha', 0.00001)
	scaleObject('head',1.58,1.58)
	scaleObject('lefthand',1.5,1.5)
	scaleObject('righthand',1.5,1.5)
	setObjectOrder('jumpscare',getObjectOrder('lefthand')-1)
	precacheImage('greenhillzone/angelisland/exejumpscare-hand')
	precacheImage('greenhillzone/angelisland/exejumpscare-head')
end
local jumpScare = {'head','lefthand','righthand'}
function onEvent(n, v1, v2)
	if n == 'jumpscare' then
		if v1 == 'flash' then
			cameraFlash('hud','000000',.6,true)
			setProperty('cameraSpeed', 400)
			triggerEvent('Camera Follow Pos', 1125, 600)
			doTweenZoom('','camGame',2,0.0001)
		end
		if v1 == 'left' then
			playAnim('lefthand','pre')
			setProperty('lefthand.alpha',1)
			setProperty('jumpscare.alpha',0)
			runTimer('flash',.15)
		end
		if v1 == 'right' then
			cameraFlash('camHUD','000000',.4,true)
			playAnim('righthand','pre')
			setProperty('lefthand.alpha',1)
			setProperty('righthand.alpha',1)
			setProperty('jumpscare.alpha', 0)
			runTimer('flash',.15)
		end
		if v1 == 'head' then
			cameraFlash('camHUD','000000',.4,true)
			playAnim('lefthand','post')
			playAnim('righthand','post')
			playAnim('head','boo')
			setProperty('lefthand.alpha',1)
			setProperty('righthand.alpha',1)
			setProperty('head.alpha',1)
			setProperty('jumpscare.alpha', 1)
			runTimer('fadeAway',0.31)
		end
		if v2 == 'removeAll' then
		removeLuaSprite('lefthand',true)
		removeLuaSprite('head',true)
		removeLuaSprite('righthand',true)
		end
		if v1 == 'removeBlackStuff' then
		removeLuaSprite('jumpscare',true)
		end
	end
end

function onTimerCompleted(tag)
	if tag == 'flash' then
		for i, specAlpha in pairs(jumpScare) do --repeats i amount of times.
			doTweenAlpha('tween'..i, specAlpha, 0, .13)
		end
		doTweenAlpha('jumpscaretween', 'jumpscare', 0, .13)
	end
	if tag == 'fadeAway' then
		for i, specAlpha in pairs(jumpScare) do --repeats i amount of times.
			doTweenAlpha('tween'..i, specAlpha, 0, .20)
		end
	end
end

function onTweenCompleted(tag)
end