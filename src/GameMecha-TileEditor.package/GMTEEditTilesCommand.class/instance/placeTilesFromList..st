execution
placeTilesFromList: aList
	"Restores all tiles as they were before the command"
	| sprite layer x y |
	
	aList keysDo: [ :coordinates |
		x := coordinates at: 1.
		y := coordinates at: 2.
		layer := coordinates at: 3.
		
		sprite := aList at: coordinates.
		self placeSprite: sprite at: x at: y in: layer]