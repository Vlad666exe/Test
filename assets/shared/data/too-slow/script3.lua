function onCreatePost()
	makeAnimatedLuaSprite('fpovIcon','icons/fpov-exe-icon-poses')
	addAnimationByPrefix('fpovIcon','idle','idle',24,true)
	addAnimationByPrefix('fpovIcon','up','up',24,true)
	addAnimationByPrefix('fpovIcon','down','down',24,true)
	addAnimationByPrefix('fpovIcon','right','right',24,true)
	addAnimationByPrefix('fpovIcon','left','left',24,true)
    setObjectCamera('fpovIcon', 'hud')
    setObjectOrder('fpovIcon', getObjectOrder('iconP2')+51)
    addLuaSprite('fpovIcon')
	playAnim('fpovIcon','idle')
	setProperty('fpovIcon.alpha',0)
end
function onStepHit()
	if curStep >= 1 then
	end
end
function onEvent(n,v1,v2)
	if n == 'tooSlowEvents' then
		if v1 == 'fpov-exe-icon' then
			if v2 == 'true' then
				setProperty('iconP2.alpha',0)
				setProperty('fpovIcon.alpha',1)
			end
			if v2 == 'false' then
				setProperty('iconP2.alpha',1)
				setProperty('fpovIcon.alpha',0)
			end
		end
	end
end
function opponentNoteHit(id, noteDirection, noteType, isSustainNote)
	if noteDirection == 0 then
		playAnim('fpovIcon','left',true)
		runTimer('setToIdle',.5)
	end
	if noteDirection == 1 then
		playAnim('fpovIcon','down',true)
		runTimer('setToIdle',.5)
	end
	if noteDirection == 2 then
		playAnim('fpovIcon','up',true)
		runTimer('setToIdle',.5)
	end
	if noteDirection == 3 then
		playAnim('fpovIcon','right',true)
		runTimer('setToIdle',.5)
	end
end
function onTimerCompleted(tag)
	if tag == 'setToIdle' then
		playAnim('fpovIcon','idle',true)
	end
end
function onUpdate()
    setProperty('fpovIcon.x', getProperty('iconP2.x'))
    setProperty('fpovIcon.y', getProperty('iconP2.y')-5)
	setProperty('fpovIcon.scale.x',getProperty('iconP2.scale.x'))
	setProperty('fpovIcon.scale.y',getProperty('iconP2.scale.y'))
end