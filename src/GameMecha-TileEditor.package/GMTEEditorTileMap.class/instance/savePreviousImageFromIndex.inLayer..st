command processing
savePreviousImageFromIndex: anIndex inLayer: aLayer
	"Saves the state of a single tile before changes. Doesn't overwrite until all changes have been"
	"sent to the Tile Editor"
	| tile | 	
		
	tile := self tileMatrixStack layer: aLayer at: anIndex y at: anIndex x.
	
	tile
		ifNil: [self previousTileStates at: {anIndex x. anIndex y. aLayer} ifAbsentPut: nil]
		ifNotNil: [self previousTileStates at: {anIndex x. anIndex y. aLayer} ifAbsentPut: tile fullResolutionSprite]