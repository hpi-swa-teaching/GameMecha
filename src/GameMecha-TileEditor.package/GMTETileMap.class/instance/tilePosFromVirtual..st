conversion
tilePosFromVirtual: aPoint
	"Answer the sender with a pixel position from a tile position (matrix[position y][position x])"

	^ (aPoint x - 1 * self tileSizeWidth) @ (aPoint y - 1 * self tileSizeHeight)