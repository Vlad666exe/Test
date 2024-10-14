local dad = ''

function onCreate()
	precacheImage(char..'.imageFile')
	precacheImage('characters/xonspeakerstho-shadow')
	precacheImage('characters/sonicexe-shadow')
end
function onCreatePost()
	makeAnimatedLuaSprite('Ghost', 'characters/sonicexe-shadow', getProperty('dad'..'.x'),getProperty('dad'..'.y'))
	addLuaSprite('Ghost')
	setProperty('Ghost.alpha', 0.0000001)
	makeAnimatedLuaSprite('Ghost', 'characters/xonspeakerstho-shadow', getProperty('dad'..'.x'),getProperty('dad'..'.y'))
	addLuaSprite('Ghost')
	setProperty('Ghost.alpha', 0.0000001)
	precacheImage('characters/xdobeondaspeakerstho-shadow')
	precacheImage('characters/sonicexe-shadow')
end
function goodNoteHit(id, direction, noteType, isSustainNote)
	if _G['boyfriendGhostData.strumTime'] == getPropertyFromGroup('notes', id, 'strumTime') and not isSustainNote then
		createGhost('boyfriend')
	end
	if not isSustainNote then
		_G['boyfriendGhostData.strumTime'] = getPropertyFromGroup('notes', id, 'strumTime')
		updateGData('boyfriend')
	end
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
	if _G['dadGhostData.strumTime'] == getPropertyFromGroup('notes', id, 'strumTime') and not isSustainNote then
		createGhost('dad')
	end
	if not isSustainNote then
		_G['dadGhostData.strumTime'] = getPropertyFromGroup('notes', id, 'strumTime')
		updateGData('dad')
	end
end
function onUpdatePost()
	if dadName == 'xondaspeakers' then
		dad = 'characters/xonspeakerstho-shadow'
	end
	if dadName == 'sonicexe' or dadName == 'fastsonicexe' then
		dad = 'characters/sonicexe-shadow'
	end
end

function createGhost(char)
	songPos = getSongPosition() --in case game stutters
	if char == 'boyfriend' then
	makeAnimatedLuaSprite(char..'Ghost'..songPos, getProperty(char..'.imageFile'),getProperty(char..'.x'),getProperty(char..'.y'))
	addLuaSprite(char..'Ghost'..songPos, false)
	setProperty(char..'Ghost'..songPos..'.scale.x',getProperty(char..'.scale.x'))
	setProperty(char..'Ghost'..songPos..'.scale.y',getProperty(char..'.scale.y'))
	setProperty(char..'Ghost'..songPos..'.flipX', getProperty(char..'.flipX'))
	setProperty(char..'Ghost'..songPos..'.alpha', 1)
	doTweenAlpha(char..'Ghost'..songPos..'delete', char..'Ghost'..songPos, 0, 0.4)
	setProperty(char..'Ghost'..songPos..'.animation.frameName', _G[char..'GhostData.frameName'])
	setProperty(char..'Ghost'..songPos..'.offset.x', _G[char..'GhostData.offsetX'])
	setProperty(char..'Ghost'..songPos..'.offset.y', _G[char..'GhostData.offsetY'])
	setObjectOrder(char..'Ghost'..songPos, getObjectOrder(char..'Group')-1)
	end
	if char == 'dad' then
	makeAnimatedLuaSprite(char..'Ghost'..songPos, dad, getProperty(char..'.x'),getProperty(char..'.y'))
	addAnimationByPrefix(char..'Ghost'..songPos, _G[char..'GhostData.name'], _G[char..'GhostData.name'], 24, false)
	addLuaSprite(char..'Ghost'..songPos, false)
	setProperty(char..'Ghost'..songPos..'.scale.x',getProperty(char..'.scale.x'))
	setProperty(char..'Ghost'..songPos..'.scale.y',getProperty(char..'.scale.y'))
	setProperty(char..'Ghost'..songPos..'.flipX', getProperty(char..'.flipX'))
	setProperty(char..'Ghost'..songPos..'.alpha', 1)
	doTweenAlpha(char..'Ghost'..songPos..'delete', char..'Ghost'..songPos, 0, 0.5)
	setProperty(char..'Ghost'..songPos..'.animation.name', _G[char..'GhostData.name'])
	setProperty(char..'Ghost'..songPos..'.offset.x', _G[char..'GhostData.offsetX'])
	setProperty(char..'Ghost'..songPos..'.offset.y', _G[char..'GhostData.offsetY'])
	setObjectOrder(char..'Ghost'..songPos, getObjectOrder(char..'Group')-1)
	playAnim(char..'Ghost'..songPos,_G[char..'GhostData.name'])
	end
end
function onTweenCompleted(tag)
	if (tag:sub(#tag- 5, #tag)) == 'delete' then
		removeLuaSprite(tag:sub(1, #tag - 6), true)
	end
end

function updateGData(char)
	_G[char..'GhostData.frameName'] = getProperty(char..'.animation.frameName')
	_G[char..'GhostData.name'] = getProperty(char..'.animation.name')
	_G[char..'GhostData.offsetX'] = getProperty(char..'.offset.x')
	_G[char..'GhostData.offsetY'] = getProperty(char..'.offset.y')
end