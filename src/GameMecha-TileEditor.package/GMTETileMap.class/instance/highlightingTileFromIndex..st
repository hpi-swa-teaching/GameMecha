accessing
highlightingTileFromIndex: anIndex
	"Answer the sender with a highlighting tile at aPoint if present"

	anIndex ifNil: [^ nil].
	
	^ self tileMatrixStackHighlighting layer: 1 at: anIndex y at: anIndex x