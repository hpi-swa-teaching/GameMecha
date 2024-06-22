layerTests
testImportButton
	"tests the import function"
	
    	self loadTestMapFileToFileDirectory.
    	[self editor importFromMorph] valueSupplyingAnswer: self fileUUID.
    	self assert: (editor tileMap tileMatrixStack layerCount == 5)