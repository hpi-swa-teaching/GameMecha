editorTests
testImportButton
	"tests the import function"
	Smalltalk at: #GitAssetLoader ifAbsent: [^ self].
	
    	self loadTestMapFileToFileDirectory.
    	[self editor importFromMorph] valueSupplyingAnswer: self fileUUID.
    	self assert: (editor tileMap tileMatrixStack layerCount == 5)