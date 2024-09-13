enumerating
doTiles: aBlock
	"Convenience method to apply aBlock to every tile (if not nil)"

	"Instance variable must be used here"
	contents ifNil: [^ nil].
	
	self contents do: [:tile | tile ifNotNil: [aBlock value: tile]]