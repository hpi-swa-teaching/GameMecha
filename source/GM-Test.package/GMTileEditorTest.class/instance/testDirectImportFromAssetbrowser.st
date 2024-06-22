layerTests
testDirectImportFromAssetbrowser
	"tests the creation of a tileMap from the git asset browser"
	
	self assert: ((GMTEEditor getTileMapFromProjectName: 'GameMecha' withPath: '/testMapFile.morph') isKindOf: GMTETileMap)