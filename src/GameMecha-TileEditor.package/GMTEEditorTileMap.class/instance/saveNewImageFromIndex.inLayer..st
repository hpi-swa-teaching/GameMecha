command processing
saveNewImageFromIndex: anIndex inLayer: aLayer
	"Saves the updated state of a single tile after changes. Is overwritten everytime there is a new change."
	
	| tile | 

	anIndex ifNil: [^ nil].
	
	tile := self tileMatrixStack layer: aLayer at: anIndex y at: anIndex x.

	tile
		ifNil: [self currentTileChanges at: {anIndex x. anIndex y. aLayer} put: nil]
		ifNotNil: [self currentTileChanges at: {anIndex x. anIndex y. aLayer} put: tile fullResolutionSprite]