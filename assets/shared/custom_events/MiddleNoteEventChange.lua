function onEvent(name, value1, value2)
if name == 'MiddleNoteEventChange' then
	for i=0,3 do
		setPropertyFromGroup('playerStrums', 0, 'x', 412)
		setPropertyFromGroup('playerStrums', 1, 'x', 524)
		setPropertyFromGroup('playerStrums', 2, 'x', 636)
		setPropertyFromGroup('playerStrums', 3, 'x', 748)
		setPropertyFromGroup('strumLineNotes', i, 'alpha', 0)
		setPropertyFromGroup('opponentStrums', 0, 'x', 3000)
		setPropertyFromGroup('opponentStrums', 1, 'x', 3000)
		setPropertyFromGroup('opponentStrums', 2, 'x', 3000)
		setPropertyFromGroup('opponentStrums', 3, 'x', 3000)
		end
	end
end