layerTests
testImportButton

    	self loadTestMapFileToFileDirectory.
    	[self editor importFromMorph] valueSupplyingAnswer: self fileUUID.
    	self assert: (editor tileMapMatrix tileMatrixStack layerCount == 5)