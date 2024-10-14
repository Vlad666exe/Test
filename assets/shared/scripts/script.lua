local songStarted = false
local poseloop = false
local leftloop = 2
local rightloop = 2
local downloop = 2
local uploop = 2

function onSongStart()
    songStarted = true
end

function goodNoteHit(i)
	--setProperty('boyfriend.animation.curAnim.paused', stringEndsWith(getProperty('notes.members['..i..'].animation.curAnim.name'), 'hold'))
end

function opponentNoteHit(i, d, t, s)
	if d == 0 and s then
		setProperty('dad.animation.curAnim.curFrame',leftloop)
		poseloop = true
	end
	if d == 1 and s then
		setProperty('dad.animation.curAnim.curFrame',downloop)
		poseloop = true
	end
	if d == 2 and s then
		setProperty('dad.animation.curAnim.curFrame',uploop)
		poseloop = true
	end
	if d == 3 and s then
		setProperty('dad.animation.curAnim.curFrame',rightloop)
		poseloop = true
	end
	--setProperty('dad.animation.curAnim.paused', stringEndsWith(getProperty('notes.members['..i..'].animation.curAnim.name'), 'hold'))
end


--function onUpdate()
    --if songStarted then
        --if getProperty('boyfriend.animation.curAnimation.name') == 'idle' and getProperty('boyfriend.animation.curAnim.paused') then
            --setProperty('boyfriend.animation.curAnim.paused', false)
        --end
    --end
--end

function onUpdatePost()	--This is here for when your character changes and has a different amount of frames
	if dadName == 'xondaspeakers' then
		leftloop = 2
		rightloop = 2
		downloop = 2
		uploop = 2
	end
	if dadName == 'fastsonicexe' then
		leftloop = 3
		rightloop = 3
		downloop = 3
		uploop = 3
	end
	if dadName == 'sonicexe' then
		leftloop = 2
		rightloop = 2
		downloop = 2
		uploop = 2
	end
end