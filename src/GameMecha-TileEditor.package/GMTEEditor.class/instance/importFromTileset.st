menu buttons
importFromTileset
	"Loads a tileset into the tile store"
	
	| tiles tileHeight dimensions|
	tileHeight := FillInTheBlankMorph request: 'Enter tile height (width is calculated by ratio)' initialAnswer: '16'.
	
	(tileHeight = '')
		ifTrue: [^ nil]
		ifFalse:[tileHeight := tileHeight asInteger].
	
	dimensions := (tileHeight @ tileHeight).
	tiles := self loadTileSetWithDimensions: dimensions.
	
	tiles ifNil: [^ nil].
	
	self tileStore morph addAllMorphs: tiles