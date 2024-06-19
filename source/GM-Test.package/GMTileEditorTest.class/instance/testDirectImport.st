layerTests
testDirectImport
	
	self loadTestMapFileToFileDirectory.
	self assert: ((GMTEEditor getTileMapFromFilePath: self fileUUID) isKindOf: GMTETileMap)