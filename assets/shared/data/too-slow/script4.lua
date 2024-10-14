function onCreate()
	makeLuaSprite('cover1', '',0,0)
	makeGraphic('cover1',screenWidth, screenHeight, '000000')
	addLuaSprite('cover1')
	setObjectCamera('cover1','camHud')
	setProperty('cover1.alpha',1)
		setProperty('scoreTxt.alpha', 0)
		setProperty('healthBar.alpha', 0)
		setProperty('healthBarBG.alpha', 0)
end
function onUpdatePost()
	if curStep < 1 then
		for i = 0,3 do
			setPropertyFromGroup('strumLineNotes', i, 'alpha', 0)
		end
		for i = 4,7 do
			setPropertyFromGroup('strumLineNotes', i, 'alpha', 0)
		end
	end
	if curStep >= 140 and curStep <= 666 then
		setProperty('cover1.alpha',0)
		setProperty('scoreTxt.alpha', 1)
		setProperty('healthBar.alpha', 1)
		setProperty('healthBarBG.alpha', 1)
	end
end
function onStepHit()
	if curStep == 120 then
	doTweenAlpha('intro','cover1',0,2.7)
    end
end