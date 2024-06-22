layerTests
testDirectImport
	"tests the creation of a tileMap from a local file path"
	
	self loadTestMapFileToFileDirectory.
	self assert: ((GMTEEditor getTileMapFromFilePath: self fileUUID) isKindOf: GMTETileMap)