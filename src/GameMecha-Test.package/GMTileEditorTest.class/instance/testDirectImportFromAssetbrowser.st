editorTests
testDirectImportFromAssetbrowser
	"tests the creation of a tileMap from the git asset browser"
	Smalltalk at: #GitAssetLoader ifAbsent: [^ self].
	
	self assert: ((GMTEEditor getTileMapFromProjectName: 'GameMecha' withPath: '/testingResources/testMapFile.morph') isKindOf: GMTETileMap)