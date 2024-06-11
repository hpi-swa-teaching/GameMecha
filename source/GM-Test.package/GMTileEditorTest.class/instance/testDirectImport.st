layerTests
testDirectImport
	self editor ifNil:
		[self setup].
	[self editor exportAsMorph] valueSupplyingAnswer: 'map.morph'.
	self assert: ((GMTEEditor getTileMapFromFilePath: 'map.morph') isKindOf: GMTETileMap).
	self tearDown.