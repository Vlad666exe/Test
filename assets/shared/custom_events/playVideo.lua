local checkTooEasy = false
local cameosPopped = false
function onEvent(name, value1, value2)
     if name == 'playVideo' then
		makeVideoSprite('myCutscene', value1, -320, -185, value2, false) -- tag, videoFile, x, y, camera, shouldLoop
		setProperty('myCutscene.alpha', 1) -- The _video is **REQUIRED**
		if value1 == 'introCutscene' then
			scaleObject('myCutscene',1,1)
			setProperty('myCutscene.x',0)
			setProperty('myCutscene.y',0)
			setProperty('myCutscene.antialiasing', true)
		else
			scaleObject('myCutscene',.675,.675)
		end
		if value1 == 'execameos' then
			setObjectOrder('myCutscene',getObjectOrder('jumpscare')+1)
			cameosPopped = true
		end
		if value1 == 'somanysouls' then
			setObjectOrder('myCutscene',getObjectOrder('healthBar')+1)
			setProperty('camZooming', false)
		end
     end
end

function onVideoFinished(tag)
	if tag == 'execameos' then
		if cameosPopped == true then
			removeLuaSprite('jumpscare',true)
		end
	end
     -- DISCLAMER! Will not call if the video has `shouldLoop` set to true!
end