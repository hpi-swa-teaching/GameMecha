removing
free
	"Correctly free tiles from layer"

	self doTiles: [:tile | tile free].
	self setNil