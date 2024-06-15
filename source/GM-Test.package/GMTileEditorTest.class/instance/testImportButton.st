layerTests
testImportButton

    |importedTileMap|

    self editor ifNil:
        [self setup].
    [self editor exportAsMorph] valueSupplyingAnswer: 'map.morph'.
    importedTileMap := ([self editor importFromMorph] valueSupplyingAnswer: 'map.morph').
    self assert: (importedTileMap isKindOf: GMTEEditableTileMap).
    self assert: (editor tileMapMatrix == importedTileMap).
    self assert: (importedTileMap model == editor).
    self tearDown