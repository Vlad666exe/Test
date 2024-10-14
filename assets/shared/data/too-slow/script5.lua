function onCreatePost()
	precacheImage('greenhillzone/angelisland/redvignette')
	precacheImage('greenhillzone/tailsflash')
	precacheImage('greenhillzone/knucklesflash')
	precacheImage('greenhillzone/eggboiflash')
	precacheImage('greenhillzone/oogabooga')
	precacheImage('greenhillzone/bf-shits-himself')
	precacheImage('greenhillzone/angelisland/dedgreenhillzonebgtreesandrocks')
	precacheImage('greenhillzone/do')
	precacheImage('greenhillzone/you')
	precacheImage('greenhillzone/wanna')
	precacheImage('greenhillzone/play')
	precacheImage('greenhillzone/with')
	precacheImage('greenhillzone/boyfriendemoji')
	precacheImage('greenhillzone/angelisland/thisissomuchfun')
	precacheImage('greenhillzone/angelisland/havingfunyet')
	makeAnimatedLuaSprite('healthGainLost','greenhillzone/angelisland/corrupted-health-anim',getProperty('healthBar.x'),getProperty('healthBar.y')-3)
	addAnimationByPrefix('healthGainLost','playAnim','healthGainLost0',24,false)
	addAnimationByPrefix('healthGainLost','noMoreHealthGain','healthGainLostKeep',24)
	setObjectCamera('healthGainLost','hud')
	addLuaSprite('healthGainLost')
	setObjectOrder('healthGainLost',getObjectOrder('healthBar')+32)
	setObjectOrder('iconP1',getObjectOrder('healthGainLost')+2)
	setObjectOrder('iconP2',getObjectOrder('healthGainLost')+3)
	setObjectOrder('scoreTxt',getObjectOrder('healthGainLost')+5)
	setProperty('healthGainLost.alpha',.001)
	makeAnimatedLuaSprite('cutscene1', 'greenhillzone/yesIknowitscursed',350,140)
	addAnimationByPrefix('cutscene1', 'playwithmefucker', 'playwithmefucker', 24, false)
	setObjectCamera('cutscene1','other')
	addLuaSprite('cutscene1')
	scaleObject('cutscene1', 1.2,1.2)
	setProperty('cutscene1.alpha',0.001)
	makeAnimatedLuaSprite('me', 'greenhillzone/me',900,500)
	addAnimationByPrefix('me', 'red', 'red', 24, false)
	addLuaSprite('me')
	setObjectCamera('me','other')
	scaleObject('me', 1.3,1.3)
	setProperty('me.alpha',0.001)
	makeAnimatedLuaSprite('funExeLaugh','greenhillzone/angelisland/exelaugh',375,0)
	scaleObject('funExeLaugh', 2.0, 2.0);
	addAnimationByPrefix('funExeLaugh','laugh','laugh',24,false)
	addLuaSprite('funExeLaugh')
	setObjectCamera('funExeLaugh','other')
	setProperty('funExeLaugh.alpha',0)
	makeLuaSprite('coverstuffhud', '',-1000,-2000)
	makeGraphic('coverstuffhud',4000, 4000, '000000')
	addLuaSprite('coverstuffhud')
	setProperty('coverstuffhud.alpha',0.00001)
	makeAnimatedLuaSprite('execameos','greenhillzone/cutscene/cameosexe',0,0)
	addAnimationByPrefix('execameos','exespawn','exespawn',24,false)
	scaleObject('execameos',1.4,1.4)
	setObjectCamera('execameos','camHud')
	addLuaSprite('execameos')
	setProperty('execameos.alpha',0.000001)
	screenCenter('execameos')
	makeAnimatedLuaSprite('execameostext','greenhillzone/cutscene/cameostext',0,0)
	addAnimationByPrefix('execameostext','text','text',24,false)
	scaleObject('execameostext',1.4,1.4)
	setObjectCamera('execameostext','camHud')
	addLuaSprite('execameostext')
	setProperty('execameostext.alpha',0.000001)
	screenCenter('execameostext')
	makeAnimatedLuaSprite('somanysoulssonic','greenhillzone/cutscene/somanysoulssonic',0,0)
	addAnimationByPrefix('somanysoulssonic','talking','talking',24,false)
	setObjectCamera('somanysoulssonic','camHud')
	scaleObject('somanysoulssonic',2.7,2.7)
	addLuaSprite('somanysoulssonic')
	screenCenter('somanysoulssonic')
	setProperty('somanysoulssonic.alpha',0.000001)
	makeAnimatedLuaSprite('somanysoulstext','greenhillzone/cutscene/somanysoulstext',0,0)
	addAnimationByPrefix('somanysoulstext','text','text',24,false)
	setObjectCamera('somanysoulstext','camHud')
	scaleObject('somanysoulstext',1.35,1.35)
	addLuaSprite('somanysoulstext')
	screenCenter('somanysoulstext')
	setProperty('somanysoulstext.alpha',0.000001)
end
local flickerCheck = false
local bgNumber = 0
local healthbarOg = getProperty('healthBar.y')
local iconP1Og = getProperty('iconP1.y')
local iconP2Og = getProperty('iconP1.y')
local healthGainLostOG = getProperty('healthGainLost.y')
local health = {'healthBar', 'iconP1', 'iconP2', 'healthGainLost'}
local healthColor = {'iconP1', 'iconP2'}
local drainAmount = 0
local scoreChange = false
local scoreTxt = ''
local missTxt = ''
local ratingTxt = ''
local finalLaugh = false
local purprBeat = true
local mechanics = true
function onEvent(n,v1,v2)
	if n == 'tooSlowEvents' then
		if v1 == 'startCutscene' then
		end
		if v1 == 'spookyAura' then
			makeLuaSprite('spookyvign','greenhillzone/angelisland/redvignette',0,0)
			addLuaSprite('spookyvign')
			setObjectCamera('spookyvign','hud')
			scaleObject('spookyvign', 4.0, 4.0);
			screenCenter('spookyvign','x')
			setProperty('spookyvign.alpha',1)
			setProperty('spookyvign.color',getColorFromHex('000000'))
			getObjectOrder('spookyvign',getObjectOrder('shader')+1)
			doTweenAlpha('spoopyFade','spookyvign',0,1.5,'quadIn')
		end
		if v1 == 'dramaticZoomIn' then --step 456
			doTweenZoom('dramatic','camGame',.75,9.5,'sineIn')
		end
		if v1 == 'flicker' then
			setObjectCamera('coverstuffhud','hud')
			setProperty('coverstuffhud.alpha',0)
			doTweenAlpha('flickeringIn','coverstuffhud',getProperty('coverstuffhud.alpha')+.05,.04)
			flickerCheck = true
		end
		if v1 == 'tailsFlash' then
			flickerCheck = false
			cancelTween('flickeringIn')
			cancelTween('flickeringOut')
			setProperty('coverstuffhud.alpha',0)
			makeLuaSprite('tailsFlash','greenhillzone/tailsflash',0,0)
			addLuaSprite('tailsFlash')
			setObjectCamera('tailsFlash','other')
			screenCenter('tailsFlash','x')
			setGraphicSize('tailsFlash',screenWidth*1.1,screenHeight*1.1)
			screenCenter('tailsFlash','xy')
			setProperty('tailsFlash.alpha',.85)
			doTweenAlpha('tailsFlashfade','tailsFlash',0,2)
		end
		if v1 == 'knucklesFlash' then
			makeLuaSprite('knucklesFlash','greenhillzone/knucklesflash',0,0)
			addLuaSprite('knucklesFlash')
			setObjectCamera('knucklesFlash','other')
			screenCenter('knucklesFlash','x')
			setGraphicSize('knucklesFlash',screenWidth*1.1,screenHeight*1.1)
			screenCenter('knucklesFlash','xy')
			setProperty('knucklesFlash.alpha',.85)
			doTweenAlpha('knucklesFlashfade','knucklesFlash',0,2)
		end
		if v1 == 'eggboiFlash' then
			makeLuaSprite('eggboiFlash','greenhillzone/eggboiflash',0,0)
			addLuaSprite('eggboiFlash')
			setObjectCamera('eggboiFlash','other')
			screenCenter('eggboiFlash','x')
			setGraphicSize('eggboiFlash',screenWidth*1,screenHeight*1)
			screenCenter('eggboiFlash','xy')
			setProperty('eggboiFlash.alpha',.85)
			doTweenAlpha('eggboiFlashfade','eggboiFlash',0,2)
		end
		if v1 == 'reveal' then --512
			setProperty('camHUD.visible',false)
			cameraFlash('other','ff0000',.1)
			makeLuaSprite('oogabooga', 'greenhillzone/oogabooga',650, -100)
			scaleObject('oogabooga', 1,1)
			addLuaSprite('oogabooga')
			makeLuaSprite('shityourself', 'greenhillzone/bf-shits-himself',917,435)
			addLuaSprite('shityourself')
			setProperty('boyfriend.alpha',0)
			removeLuaSprite('sky', true)
			removeLuaSprite('shader', true)
			removeLuaSprite('treesandrocks', true)
			makeLuaSprite('dedtreesandrocks', 'greenhillzone/angelisland/dedgreenhillzonebgtreesandrocks', -1300, -30)
			scaleObject('dedtreesandrocks', 3.0,3.0)
			addLuaSprite('dedtreesandrocks')
			setScrollFactor('dedtreesandrocks',.25,.05)
			setObjectOrder('dedtreesandrocks',getObjectOrder('pointythings')+1)
			doTweenColor('bloodred','ocean','ff0000',0.001)
			doTweenColor('bloodredsmall','smallwater','ff0000',0.001)
			doTweenColor('bloodredlarge','largewater','ff0000',0.001)
			drainAmount = 0.025
		end
		if v1 == 'loading' then
			if v2 == 'start' then --513
				cameraFlash('other','ff0000',.4,true)
				setObjectCamera('coverstuffhud','other')
				setProperty('coverstuffhud.alpha', 1)
				setObjectOrder('cutscene1',getObjectOrder('coverstuffhud')+1)
				setProperty('cutscene1.alpha',1)
				doTweenX('cutscene1X', 'cutscene1.scale', .65, 1.6, 'sineIn')
				doTweenY('cutscene1Y', 'cutscene1.scale', .65, 1.6,'sineIn');
				playAnim('cutscene1', 'playwithmefucker',true)
				setProperty('camHUD.visible',true)
			end
			if v2 == 'do' then
				makeLuaSprite('do', 'greenhillzone/do',100,150)
				addLuaSprite('do')
				setObjectCamera('do','other')
				scaleObject('do', .55,.55)
				setObjectOrder('do',getObjectOrder('coverstuffhud')+1)
				doTweenAlpha('doAlpha','do',1,1.5,'cubeOut')
				setProperty('boyfriend.alpha',1)
				removeLuaSprite('shityourself',true)
			end
			if v2 == 'you' then
				makeLuaSprite('you', 'greenhillzone/you',600,25)
				addLuaSprite('you')
				setObjectCamera('you','other')
				scaleObject('you', .55,.55)
				setObjectOrder('you',getObjectOrder('coverstuffhud')+1)
				doTweenAlpha('youAlpha','you',1,.5,'cubeOut')
			end
			if v2 == 'wanna' then
				makeLuaSprite('wanna', 'greenhillzone/wanna',950,200)
				addLuaSprite('wanna')
				setObjectCamera('wanna','other')
				scaleObject('wanna', .55,.55)
				setObjectOrder('wanna',getObjectOrder('coverstuffhud')+1)
				doTweenAlpha('wannaAlpha','wanna',1,.75)
			end
			if v2 == 'play' then
				makeLuaSprite('play', 'greenhillzone/play',80,520)
				addLuaSprite('play')
				setObjectCamera('play','other')
				scaleObject('play', .6,.6)
				setObjectOrder('play',getObjectOrder('coverstuffhud')+1)
				doTweenAlpha('playAlpha','play',1,.75,'cubeOut')
				removeLuaScript('data/too-slow/fakericon')
			end
			if v2 == 'with' then
				makeLuaSprite('with', 'greenhillzone/with',600,600)
				addLuaSprite('with')
				setObjectCamera('with','other')
				scaleObject('with', .55,.55)
				setObjectOrder('with',getObjectOrder('coverstuffhud')+1)
				doTweenAlpha('withAlpha','with',1,.75,'cubeOut')
			end
			if v2 == 'me' then
				setObjectOrder('me',getObjectOrder('coverstuffhud')+1)
				doTweenAlpha('meAlpha','me',1,.95,'cubeIn')
				runTimer('meTimer',.11)
			end
			if v2 == 'switchBG' then
				if bgNumber == 0 then
					makeLuaSprite('dedtree1', 'greenhillzone/angelisland/angelislandtree',-500,-840)
					makeLuaSprite('dedtree2', 'greenhillzone/angelisland/angelislandtree',1300,-700)
					makeLuaSprite('dedtree3', 'greenhillzone/angelisland/angelislandtree',-1400,-600)
					scaleObject('dedtree1',1.5,1.5)
					scaleObject('dedtree2',1.5,1.5)
					scaleObject('dedtree3',1.5,1.5)
					addLuaSprite('dedtree2')
					addLuaSprite('dedtree3')
					addLuaSprite('dedtree1')
					setObjectOrder('dedtree1',getObjectOrder('tree1'))
					setObjectOrder('dedtree2',getObjectOrder('tree2'))
					setObjectOrder('dedtree3',getObjectOrder('tree3'))
					removeLuaSprite('tree1',true)
					removeLuaSprite('tree2',true)
					removeLuaSprite('tree3',true)
					bgNumber = 1
				elseif bgNumber == 2 then
					makeLuaSprite('gfshadow', 'greenhillzone/angelisland/gfshadow', 130, 585)
					scaleObject('gfshadow',2,1.6)
					addLuaSprite('gfshadow')
					setObjectOrder('gfshadow',getObjectOrder('dedgrass')+1)
					setObjectOrder('dedpurpr1',getObjectOrder('purpr1'))
					setObjectOrder('dedpurpr2',getObjectOrder('purpr2'))
					setProperty('dedpurpr1.alpha', 1)
					setProperty('dedpurpr2.alpha', 1)
					function onBeatHit()
    					if curBeat % 2 == 1 and purprBeat == true then
							playAnim('dedpurpr2', 'bouncing',true)
    					end
    					if curBeat % 2 == 0 and purprBeat == true then
							playAnim('dedpurpr1', 'bouncing',true)
    					end
					end
					removeLuaSprite('purpr1',true)
					removeLuaSprite('purpr2',true)
					bgNumber = 3
				elseif bgNumber == 1 then
					makeLuaSprite('dedgrass', 'greenhillzone/angelisland/deadgrass',-1635,560)
					scaleObject('dedgrass',3.5,3.0)
					addLuaSprite('dedgrass')
					setObjectOrder('dedgrass',getObjectOrder('grass'))
					removeLuaSprite('grass',true)
					bgNumber = 2
				elseif bgNumber == 3 then
					makeLuaSprite('dedsun1', 'greenhillzone/angelisland/deadsun', 1345, 0)
					makeLuaSprite('dedsun2', 'greenhillzone/angelisland/deadsun', -805, 0)
					scaleObject('dedsun1', 1.75,1.75)
					scaleObject('dedsun2', 1.75,1.75)
					addLuaSprite('dedsun1')
					setProperty('dedsun1.flipX', true)
					addLuaSprite('dedsun2')
					setObjectOrder('dedsun1',getObjectOrder('sun1'))
					setObjectOrder('dedsun2',getObjectOrder('sun2'))
					removeLuaSprite('sun2',true)
					removeLuaSprite('sun1',true)
					setProperty('health', 1)
					bgNumber = 4
				end
			end
		end
		if v1 == 'laughResizing' then --664
			cameraSetTarget('dad')
			scaleObject('dad',1.332,1.332) -- The devil's number
			setProperty('dad.x',getProperty('dad.x')-122)
			setProperty('dad.y',getProperty('dad.y')-121)
			setProperty('defaultCamZoom', .9)
			setProperty('cameraSpeed', 2.2)
			doTweenZoom('again','camGame',.8,.6,'backOut')
		end
		if v1 == 'tryAgain' then --672
			setObjectCamera('coverstuffhud','game')
			setProperty('coverstuffhud.alpha',1)
			setObjectOrder('coverstuffhud',getObjectOrder('dedgrass')+18)
			doTweenZoom('again','camGame',1.7,.3,'elasticOut')
			setProperty('defaultCamZoom', 1.7)
			setProperty('tryagaintext.alpha', 1)
			setObjectOrder('tryagaintext',getObjectOrder('iconP1')+1)
			playAnim('tryagaintext','flash')
			setProperty('dad.x',-372)
			setProperty('dad.y',279)
			triggerEvent('Camera Follow Pos',-170,460)
			setProperty('cameraSpeed',1000)
		end
		if v1 == 'tryAgainFade' then --700
			doTweenAlpha('textfade','tryagaintext',0,1.5,'sineIn')
			doTweenAlpha('coverfade','coverstuffhud',0,1.5,'quadIn')
			doTweenZoom('again','camGame',.75,1.75,'quadIn')
		end
		if v1 == 'rescaleExe' then
			doTweenX('','camFollow',70,2.5,'quadInOut')
			setProperty('defaultCamZoom', .75)
			scaleObject('dad',2,2)
		end
		if v1 == 'stare' then
			doTweenZoom('stare','camGame',1.3,1.5)
			setProperty('cameraSpeed', 2)
			makeLuaSprite('redvign2','greenhillzone/angelisland/redvignette',0,0)
			scaleObject('redvign2', 4.0, 4.0);
			addLuaSprite('redvign2')
			setObjectCamera('redvign2','hud')
			screenCenter('redvign2','x')
			setProperty('redvign2.alpha',0)
			setProperty('redvign2.color',getColorFromHex('000000'))
			doTweenAlpha('starevign','redvign2',1,1)
		end
		if v1 == 'stopStaring' then
			doTweenX('','camFollow',70,1,'quadInOut')
			doTweenZoom('stopstaring','camGame',.75,.75,'quadIn')
			doTweenAlpha('starevign','redvign2',0,.5)
			setProperty('cameraSpeed', 1.7)
		end
		if v1 == 'cameraFlashRed' then
			cameraFlash('other','ff0000',.4,true)
		end
		if v1 == 'cutscenes' then
			if v2 == 'execameosSpawn' then
				setProperty('execameos.alpha',1)
				playAnim('execameos','exespawn', true)
				setProperty('execameostext.alpha',1)
				playAnim('execameostext','text', true)
			end
			if v2 == 'execameosRemove' then
				removeLuaSprite('execameos',true)
				removeLuaSprite('execameostext',true)
			end
			if v2 == 'somanysoulsSpawn' then
				cameraFlash('other','ff0000',.25,true)
				setProperty('somanysoulssonic.alpha', 1)
				playAnim('somanysoulssonic','talking',true)
				setProperty('somanysoulstext.alpha', 1)
				playAnim('somanysoulstext','text',true)
				setProperty('coverstuffhud.alpha',1)
				setObjectCamera('coverstuffhud','camHud')
				setObjectOrder('coverstuffhud',getObjectOrder('somanysoulssonic')-1)
				setProperty('camZooming', false)
			end
			if v2 == 'somanysoulsRemove' then
				removeLuaSprite('somanysoulssonic',true)
				removeLuaSprite('somanysoulstext',true)
				setProperty('coverstuffhud.alpha',0.000001)
			end
		end
		if v1 == 'stopglitchshader' then
			setProperty('glitchShaderBlack.alpha',0)
		end
		if v1 == 'healthbarThings' then
			if v2 == 'healthbarAppears' then
				setProperty('healthBar.y',130)
				setProperty('iconP1.y',getProperty('healthBar.y')-70)
				setProperty('iconP2.y',getProperty('healthBar.y')-70)
				setProperty('healthGainLost.y',getProperty('healthBar.y')-3)
				makeLuaSprite('healthFlash', '',getProperty('healthBar.x'),getProperty('healthBar.y'))
				makeGraphic('healthFlash',getProperty('healthBar.width'), getProperty('healthBar.height'), 'FF0000')
				addLuaSprite('healthFlash')
				setObjectCamera('healthFlash','hud')
				setObjectOrder('healthFlash',getObjectOrder('healthGainLost')+1)
				doTweenY('healthFlashytween','healthFlash',getProperty('healthBar.y')+40,.4,'quadOut')
				doTweenAlpha('healthFlashyFade','healthFlash',0,.6,'quadOut')
				removeLuaScript('custom_events/glitchShader')
				setProperty('healthBar.alpha',1)
				for i, specColor in pairs(healthColor) do
				setProperty(specColor..'.colorTransform.redOffset',255)
				setProperty(specColor..'.colorTransform.redMultiplier',0)
				setProperty(specColor..'.colorTransform.greenMultiplier',0)
				setProperty(specColor..'.colorTransform.blueMultiplier',0)
				setProperty(specColor..'.alpha',1)
				runHaxeCode([[
					FlxTween.tween(game.]]..specColor..[[.colorTransform, { redOffset: 0, greenOffset: 0, blueOffset: 0, redMultiplier: 1, greenMultiplier: 1, blueMultiplier: 1 }, .6);
					]])
				end
				for i, specHealth in pairs(health) do --repeats i amount of times.
					doTweenY('ytween'..i,specHealth,getProperty(specHealth..'.y')+40,.4,'quadOut')
				end
			end
			if v2 == 'YA!' then
				makeLuaSprite('ya','greenhillzone/boyfriendemoji',getProperty('iconP1.x')+20,getProperty('iconP1.y')-3)
				addLuaSprite('ya')
				makeLuaText('yaText','YA!',50,getProperty('iconP1.x')+60,getProperty('iconP1.y')-25)
				addLuaText('yaText')
				setTextSize('yaText','30')
				setTextColor('yaText','31b0d1')
				setTextFont('yaText','friday night.ttf')
				setProperty('yaText.antialiasing',true)
				setObjectCamera('ya','hud')
				setObjectOrder('ya',getObjectOrder('iconP1')+38)
				setObjectCamera('yaText','hud')
				setObjectOrder('yaText',getObjectOrder('ya')+1)
				setProperty('ya.angle',5.9)
				setProperty('iconP1.visible',false)
				doTweenY('yaTweenY','ya',getProperty('iconP1.y')+18,.3)
				doTweenY('yaTextTweenY','yaText',getProperty('iconP1.y')-10,.5,'backInOut')
				doTweenX('yaTweenX','ya',getProperty('iconP1.x')+14,.3)
				doTweenAngle('yaTweenAngle','ya',-6.05,.3)
			end
			if v2 == 'healthbarDisappears' then
				for i, specHealth in pairs(health) do --repeats i amount of times.
					doTweenY('ytween'..i,specHealth,getProperty(specHealth..'.y')-20,.3,'quadIn')
				end
				doTweenY('healthFlashytween','healthFlash',getProperty('healthBar.y')-20,.3,'quadIn')
				runTimer('takeAwayHealthGain',.2)
				drainAmount = 0.01
				healthMechanic('turnOffHealthGain')
			end
			if v2 == 'returnToNormal' then
				removeLuaSprite('healthFlash',true)
				setProperty('healthBar.y',healthbarOg)
				setProperty('iconP1.y',iconP1Og)
				setProperty('iconP2.y',iconP2Og)
				setProperty('healthGainLost.y',getProperty('healthBar.y')-3)
				setProperty('camZooming', true)
			end
		end
		if v1 == 'talkingtoplayer' then
			if v2 == 'thisissofunText' then
				makeLuaSprite('muchfun', 'greenhillzone/angelisland/thisissomuchfun',0,0)
				scaleObject('muchfun', 4.0, 4.0);
				setGraphicSize('muchfun', screenWidth,screenHeight)
				addLuaSprite('muchfun')
				setObjectCamera('muchfun','other')
				screenCenter('muchfun','xy')
			end
			if v2 == 'sofunlaugh' then
				setProperty('funExeLaugh.alpha',1)
				setProperty('funExeLaugh.y',500)
				playAnim('funExeLaugh','laugh')
				doTweenY('exeLaughTweenY','funExeLaugh',0,.2,'backOut')
				setObjectOrder('funExeLaugh',getObjectOrder('muchfun')+1)
				healthMechanic('restore')
			end
			if v2 == 'areyouhavingfun' then
				makeLuaSprite('funbg', 'greenhillzone/angelisland/funbg',0,0)
				scaleObject('funbg', 4.0, 4.0);
				setGraphicSize('funbg', screenWidth,screenHeight)
				addLuaSprite('funbg')
				setObjectCamera('funbg','other')
				screenCenter('funbg','xy')
				healthMechanic('restore')
			end
			if v2 == 'havingfunRemove' then
				removeLuaSprite('funbg',true)
			end
		end
		if v1 == 'finalLaugh' then
			setObjectOrder('coverstuffhud',getObjectOrder('gf')+20)
			doTweenAlpha('sillyCoverFade','coverstuffhud',1,.2)
			finalLaugh = true
		end
		if v1 == 'changeHudText' then
			scoreChange = true
			local hudText = split(v2,",") -- Score, Miss, Rating (copied from cinematics event). This will probably be turned into an event in the future
			scoreTxt = hudText[1]
			missTxt = hudText[2]
			ratingTxt = hudText[3]
			setTextString('scoreTxt', scoreTxt..': '..getScore()..' | '..missTxt..': '..getMisses()..' | '..ratingTxt..': '..ratingName..' ('..((math.floor(getProperty('ratingPercent') * 10000) / 100))..'%) - '..ratingFC)
		end
		if v1 == 'TooSlow' then
			doTweenAlpha('dadFadeAway','dad',0,.5)
		end
		if v1 == 'removeBg' then
			removeLuaSprite('dedtreesandrocks', true)
			removeLuaSprite('dedpurpr1',true)
			removeLuaSprite('dedpurpr2',true)
			removeLuaSprite('dedsun2',true)
			removeLuaSprite('dedsun1',true)
			removeLuaSprite('dedgrass',true)
			removeLuaSprite('dedtree1',true)
			removeLuaSprite('dedtree2',true)
			removeLuaSprite('dedtree3',true)
			removeLuaSprite('smallwater',true)
			removeLuaSprite('largewater',true)
			removeLuaSprite('ocean',true)
			removeLuaSprite('pointythings',true)
			removeLuaSprite('coverstuffhud',true)
			removeLuaSprite('gfshadow',true)
			setProperty('gf.alpha',0)
			purprBeat = false
		end
	end
	if n == 'sufferingsiblings' then
		if v1 == '' then
			setProperty('health',1)
		end
		if v1 == 'remove' then
			setProperty('health',2)
		end
	end
	if n == 'jumpscare' then
		if v2 == 'removeAll' then
			setProperty('health',2)
			drainAmount = .011
		end
	end
end
function split(s, delimiter)
    result = {};
    for match in (s..delimiter):gmatch("(.-)"..delimiter) do
        table.insert(result, tostring(match));
    end
    return result;
end
function onUpdatePost()
	if finalLaugh == true then
		if mustHitSection == false then
			triggerEvent('Camera Follow Pos',1125,100)
			setProperty('defaultCamZoom',.4)
		else
			triggerEvent('Camera Follow Pos', 1125, 600)
			setProperty('defaultCamZoom',.9)
		end
	end
end
function onUpdateScore()
	if scoreChange == true then
		setTextString('scoreTxt', scoreTxt..': '..getScore()..' | '..missTxt..': '..getMisses()..' | '..ratingTxt..': '..ratingName..' ('..((math.floor(getProperty('ratingPercent') * 10000) / 100))..'%) - '..ratingFC)
	end
end
function onTimerCompleted(tag)
	if tag == 'meTimer' then
		playAnim('me', 'red',true)
	end
	if tag == 'takeAwayHealthGain' then
		setProperty('healthGainLost.alpha',1)
		playAnim('healthGainLost','playAnim')
	end
end
function onTweenCompleted(tag)
	if tag== 'exeLaughTweenScaleX' then
		removeLuaSprite('funExeLaugh',true)
		removeLuaSprite('muchfun',true)
		setProperty('cameraSpeed', 400)
		triggerEvent('Camera Follow Pos', 1125, 600)
		doTweenZoom('bounce','camGame',1.2,.05,'linear')
	end
	if tag == 'exeLaughTweenY' then
		doTweenX('exeLaughTweenScaleX','funExeLaugh.scale',5,.75,'expoIn')
		doTweenY('exeLaughTweenScaleY','funExeLaugh.scale',5,.75,'expoIn')
	end
	if tag == 'healthFlashyFadeIn' then
		for i, specAlpha in pairs(health) do
			doTweenAlpha('fadeaway'..i,specAlpha,0,.4)
		end
		doTweenAlpha('redHealthFade','healthFlash',0,.4)
	end
	if tag == 'yaTextTweenY' then
	removeLuaText('yaText')
	end
	if tag == 'yaTweenAngle' then
		setProperty('iconP1.visible',true)
		removeLuaSprite('ya',true)
	end
	if tag == 'coverfade' then
		removeLuaSprite('tryagaintext',true)
		setProperty('coverstuffhud.alpha', 0)
	end
	if tag == 'spoopyFade' then
		removeLuaSprite('spookyvign')
	end
	if tag == 'tailsFlashfade' then
		removeLuaSprite('tailsFlash',true)
	end
	if tag == 'knucklesFlashfade' then
		removeLuaSprite('knucklesFlash',true)
	end
	if tag == 'eggboiFlashfade' then
		removeLuaSprite('eggboiFlash',true)
	end
	if tag == 'flickeringIn' and flickerCheck == true then
		doTweenAlpha('flickeringOut','coverstuffhud',getProperty('coverstuffhud.alpha')-.05,.04)
	end
	if tag == 'flickeringOut' and flickerCheck == true then
		doTweenAlpha('flickeringIn','coverstuffhud',getProperty('coverstuffhud.alpha')+.1,.045)
	end
end
function healthMechanic(fuckenNAME)
	if fuckenNAME == 'restore' then
		setProperty('health',.5)
	end
	if fuckenNAME == 'turnOffHealthGain' and mechanics == true then
		setProperty('healthGain',0)
		setProperty('healthLoss',.6)
	end
end
function opponentNoteHit()
	if getProperty('health') >= drainAmount and mechanics == true then
		addHealth(-drainAmount)
	end
end