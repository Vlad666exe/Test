function onCreatePost()
	makeAnimatedLuaSprite('eggman', 'greenhillzone/angelisland/eggmansoul', 275, -300)
	scaleObject('eggman', 2.0, 2.0);
	addAnimationByPrefix('eggman', 'idle1', 'i_want_two_number_nines', 24, true)
	addAnimationByPrefix('eggman', 'idle2', 'a_number_nine_large', 24, true)
	addAnimationByPrefix('eggman', 'looking', 'number_six_with_extra_dip', 24, false)
	addLuaSprite('eggman')
	setProperty('eggman.alpha',0.0001)
	setObjectOrder('eggman',getObjectOrder('gf')+15)
	makeAnimatedLuaSprite('knuckles', 'greenhillzone/angelisland/knucklessoul', 900, 25)
	scaleObject('knuckles', 2.0, 2.0);
	addAnimationByPrefix('knuckles', 'idle1', 'a_number_seven', 24, true)
	addAnimationByPrefix('knuckles', 'looking', 'two_number_forty_fives_one_with_cheese', 24, false)
	addAnimationByPrefix('knuckles', 'idle2', 'and_a_large_soda', 24, true)
	addLuaSprite('knuckles')
	setProperty('knuckles.alpha',0.0001)
	setObjectOrder('knuckles',getObjectOrder('gf')+100)
	makeAnimatedLuaSprite('tails', 'greenhillzone/angelisland/tailssoul', 0, 50)
	scaleObject('tails', 2.0, 2.0);
	addAnimationByPrefix('tails', 'idle1', 'i_want_a_bagel', 24, true)
	addAnimationByPrefix('tails', 'looking', 'what', 24, false)
	addAnimationByPrefix('tails', 'idle2', 'two_bagels_actually', 24, true)
	addLuaSprite('tails')
	setProperty('tails.alpha',0.0001)
	setObjectOrder('tails',getObjectOrder('gf')+100)
	makeLuaSprite('victims', 'greenhillzone/angelisland/saveyourself',0,0)
	addLuaSprite('victims')
	setProperty('victims.alpha',0.0001)
	setObjectCamera('victims','camHUD')
	setGraphicSize('victims',screenWidth*1.1,screenHeight*1.1)
	setObjectOrder('victims',getObjectOrder('timebar')+100)
end

function floatingSpirits()
	doTweenY('eggmanDown','eggman',-290,2,'quadInOut')
	doTweenY('tailsUp','tails',40,2.4,'quadInOut')
	doTweenY('knucklesDown','knuckles',35,1.5,'quadInOut')
end

function onEvent(n,v1,v2)
	if n == 'TheSoulsOfTheInnocence' then
	if v1 == '' then
		setProperty('camZooming', false)
		setProperty('tails.alpha',.8)
		setProperty('eggman.alpha',.8)
		setProperty('knuckles.alpha',.8)
		playAnim('tails','idle1')
		playAnim('eggman','idle1')
		playAnim('knuckles','idle1')
		floatingSpirits()
		setProperty('dad.alpha',0)
		setProperty('boyfriend.alpha',0)
		end
	if v1 == 'lookAtPlayer' then
		playAnim('tails','looking')
		playAnim('eggman','looking')
		playAnim('knuckles','looking')
	end
	if v1 == 'jumpscare' then
		setProperty('victims.alpha',1)
		screenCenter('victims','xy')
		cameraShake('camHUD',0.0035,.75)
	end
	if v2 == 'remove' then
		removeLuaSprite('tails',true)
		removeLuaSprite('eggman',true)
		removeLuaSprite('knuckles',true)
		removeLuaSprite('victims',true)
		setProperty('dad.alpha',1)
		setProperty('boyfriend.alpha',1)
	end
	end
end

function onTweenCompleted(tag)
	if tag == 'eggmanDown' then
		doTweenY('eggmanUp','eggman',-300,2,'quadInOut')
	end
	if tag == 'eggmanUp' then
		doTweenY('eggmanDown','eggman',-290,2,'quadInOut')
	end
	if tag == 'tailsUp' then
		doTweenY('tailsDown','tails',50,2,'quadInOut')
	end
	if tag == 'tailsDown' then
		doTweenY('tailsUp','tails',40,2,'quadInOut')
	end
	if tag == 'knucklesDown' then
		doTweenY('knucklesUp','knuckles',25,2,'quadInOut')
	end
	if tag == 'knucklesUp' then
		doTweenY('knucklesDown','knuckles',35,2,'quadInOut')
	end
end

function onUpdate()
	if 'eggman.animation.curAnim.name' == 'looking' and 'eggman.animation.curAnim.curFrame' == 23 then
		playAnim('eggman','idle2')
		playAnim('tails','idle2')
		playAnim('knuckles','idle2')
	end

end