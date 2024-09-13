conversion
tileIndexFromPosition: aPoint
	"Answer the sender with a tile index (matrix[index x y][index x]) from a pixel position"

	| uncorrectedPos index |
	uncorrectedPos := self revertViewCorrectedTilePositionMap: aPoint.

	index := ((uncorrectedPos x / self tileSizeWidth + 1) @ (uncorrectedPos y / self tileSizeHeight + 1)) floor.
	
	((self tileMatrixStackHighlighting layer: 1) validIndex: index) ifFalse: [^ nil].
	^ index