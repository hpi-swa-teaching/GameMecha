updating
updateTiles: anIndexSet inLayer: aLayer FromEvent: anEvent
	
	| validLeftClick validRightClick |
	(self tileIndexFromPosition: anEvent position) ifNil: [^ nil].
	
	validLeftClick := anEvent redButtonChanged and: [self model selectedTile notNil].
	validRightClick := anEvent yellowButtonChanged.
	
	validLeftClick ifTrue: [self placeTiles: anIndexSet inLayer: aLayer].	
	validRightClick ifTrue: [self deleteTiles: anIndexSet inLayer: aLayer].