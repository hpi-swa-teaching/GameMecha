accessing
backgroundTile: anObject

	(backgroundTile = anObject)
		ifTrue: [backgroundTile := GMTETile checkerBoardTile]
		ifFalse: [backgroundTile := anObject].
	"TODO: keep this here? TileMap must know backgorund Tiles"
	self tileMap backgroundTiles: backgroundTile