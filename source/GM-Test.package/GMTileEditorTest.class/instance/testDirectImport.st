layerTests
testDirectImport
	
	[self editor exportAsMorph] valueSupplyingAnswer: 'map.morph'.
	self assert: ((GMTEEditor getTileMapFromFilePath: 'map.morph') isKindOf: GMTETileMap)