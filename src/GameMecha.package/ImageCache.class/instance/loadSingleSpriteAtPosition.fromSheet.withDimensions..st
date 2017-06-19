io
loadSingleSpriteAtPosition: coordinates fromSheet: aSheet withDimensions: sheetDimensions
	| spriteSize spriteStart |
	spriteSize := aSheet extent / sheetDimensions. 
	spriteStart := (coordinates-1) * spriteSize.
	^self loadPartOf: aSheet withBounds: (spriteStart extent: spriteSize).
	