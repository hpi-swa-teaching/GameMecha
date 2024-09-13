updating
step
	"Workaround since ScrollPane doesn't resize it's submorphs. This is to ensure our TileContainer rearranges itself"
	
	| n gap minTileSize |
	(self parent isNil or: [self parent extent = self extent])
		ifTrue: [^ nil].
	
	self extent: self parent extent.
	minTileSize := GMTETileContainer minTileSize. 
	n := self width / minTileSize.
	gap := self width - (n floor * minTileSize) / n.
	self submorphs do: [:tile| tile extent: (minTileSize + gap - 2)] "Edge has a width of 1"