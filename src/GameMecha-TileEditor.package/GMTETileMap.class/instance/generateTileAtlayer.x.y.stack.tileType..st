initialization
generateTileAtlayer: aLayer x: x y: y stack: aStack tileType: aTileClass
	"Covenience method to generate tiles on the editable matrix stack"

	^ self generateTileAtlayer: aLayer x: x y: y stack: aStack tileType: aTileClass posCorrectionBlock: [:aPoint | 
		self correctedTilePositionMap: aPoint]

	
		
	