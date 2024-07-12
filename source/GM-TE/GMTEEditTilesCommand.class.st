"
Command that records changes of tiles in the tilemap
"
Class {
	#name : #GMTEEditTilesCommand,
	#superclass : #GMTECommand,
	#instVars : [
		'editor',
		'tileMap',
		'previousSprites',
		'currentSprites'
	],
	#category : 'GM-TE-Editor'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Alex M 7/1/2024 17:59'
}
GMTEEditTilesCommand class >> previousTiles: aDictionary1 currentTiles: aDictionary2 tilemap: aTileMap [

	^ (self new)
		tileMap: aTileMap;
		previousSprites: aDictionary1;
		currentSprites: aDictionary2;
		yourself
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alex M 7/12/2024 21:48'
}
GMTEEditTilesCommand >> currentSprites [

	^ currentSprites
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alex M 7/12/2024 21:48'
}
GMTEEditTilesCommand >> currentSprites: anObject [

	currentSprites := anObject
]

{
	#category : #execution,
	#'squeak_changestamp' : 'Alex M 7/10/2024 13:42'
}
GMTEEditTilesCommand >> do [
	
	self placeTilesFromList: self currentSprites
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alex M 7/12/2024 21:38'
}
GMTEEditTilesCommand >> editor [

	^ editor
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alex M 7/12/2024 21:38'
}
GMTEEditTilesCommand >> editor: anObject [

	editor := anObject
]

{
	#category : #execution,
	#'squeak_changestamp' : 'Alex M 7/12/2024 22:32'
}
GMTEEditTilesCommand >> placeSprite: aSprite at: x at: y in: aLayer [

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
]

{
	#category : #execution,
	#'squeak_changestamp' : 'Alex M 7/12/2024 22:31'
}
GMTEEditTilesCommand >> placeTilesFromList: aList [
	"Restores all tiles as they were before the command"
	| sprite layer x y |
	
	aList keysDo: [ :coordinates |
		x := coordinates at: 1.
		y := coordinates at: 2.
		layer := coordinates at: 3.
		
		sprite := aList at: coordinates.
		self placeSprite: sprite at: x at: y in: layer]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alex M 7/12/2024 21:38'
}
GMTEEditTilesCommand >> previousSprites [

	^ previousSprites
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alex M 7/12/2024 21:38'
}
GMTEEditTilesCommand >> previousSprites: anObject [

	previousSprites := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alex M 7/12/2024 21:38'
}
GMTEEditTilesCommand >> tileMap [

	^ tileMap
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alex M 7/12/2024 21:38'
}
GMTEEditTilesCommand >> tileMap: anObject [

	tileMap := anObject
]

{
	#category : #execution,
	#'squeak_changestamp' : 'Alex M 7/10/2024 13:43'
}
GMTEEditTilesCommand >> undo [
	
	self placeTilesFromList: self previousSprites
]
