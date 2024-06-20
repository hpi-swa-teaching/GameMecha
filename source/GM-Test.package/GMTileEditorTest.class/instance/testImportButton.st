layerTests
testImportButton

    	self loadTestMapFileToFileDirectory.
    	[self editor importFromMorph] valueSupplyingAnswer: self fileUUID.
    	self assert: (editor tileMap tileMatrixStack layerCount == 5)