editorTests
testDirectImport
	"tests the creation of a tileMap from a local file path"
	Smalltalk at: #GitAssetLoader ifAbsent: [^ self].
	
	self loadTestMapFileToFileDirectory.
	self assert: ((GMTEEditor getTileMapFromFilePath: self fileUUID) isKindOf: GMTETileMap)