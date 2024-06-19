layerTests
testDirectImportFromAssetbrowser
	
	self assert: ((GMTEEditor getTileMapFromProjectName: 'GameMecha' withPath: '/testMapFile.morph') isKindOf: GMTETileMap)