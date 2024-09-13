execution
placeSprite: aSprite at: x at: y in: aLayer

	"Restores a single tile as it was before the command"
	| tile |

	tile := self tileMap tileMatrixStack layer: aLayer at: y at: x.
	tile
		ifNil: [aSprite 
			ifNotNil: [
				tile := self tileMap generateTileAtlayer: aLayer x: x y: y stack: self tileMap tileMatrixStack tileType: GMTETile. 
				tile updateSprite: aSprite]]
		ifNotNil: [aSprite
			ifNil: [
				self tileMap tileMatrixStack layer: aLayer at: y at: x put: nil.
				tile abandon]
			ifNotNil: [tile updateSprite: aSprite]]