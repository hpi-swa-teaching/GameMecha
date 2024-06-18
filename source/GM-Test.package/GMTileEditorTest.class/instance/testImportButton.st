layerTests
testImportButton

    	|importedTileMap|
	
    	self loadTestMapFileToFileDirectory.
    	importedTileMap := ([self editor importFromMorph] valueSupplyingAnswer: 'map.morph').
    	self assert: (importedTileMap isKindOf: GMTEEditableTileMap).
    	self assert: (editor tileMapMatrix == importedTileMap).
    	self assert: (importedTileMap model == editor)