Class {
	#name : #GMTEEditTilesCommand,
	#superclass : #GMTECommand,
	#instVars : [
		'editor',
		'tileMap',
		'previousSprites',
		'currentSprites'
	],
	#category : #'GM-TE-Editor'
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
	#'squeak_changestamp' : 'Alex M 6/28/2024 02:45'
}
GMTEEditTilesCommand >> currentSprites [
	^ currentSprites
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alex M 6/28/2024 02:45'
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
	#'squeak_changestamp' : 'Alex M 7/12/2024 17:12'
}
GMTEEditTilesCommand >> editor [
	^ editor
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alex M 7/12/2024 17:12'
}
GMTEEditTilesCommand >> editor: anObject [
	editor := anObject
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'Alex M 6/28/2024 02:45'
}
GMTEEditTilesCommand >> initialize [

	self
		previousSprites: Dictionary new;
		currentSprites: Dictionary new
]

{
	#category : #execution,
	#'squeak_changestamp' : 'Alex M 7/12/2024 19:47'
}
GMTEEditTilesCommand >> placeTilesFromList: aList [
	| tile sprite layer x y tileMap |
	
	tileMap := self tileMap.
	aList keysDo: [ :coordinates |
		x := coordinates at: 1.
		y := coordinates at: 2.
		layer := coordinates at: 3.
		
		tile := tileMap tileMatrixStack layer: layer at: y at: x.
		sprite := aList at: coordinates.
		tile
			ifNil: [sprite 
				ifNotNil: [
					tile := tileMap generateTileAtlayer: layer x: x y: y stack: tileMap tileMatrixStack tileType: GMTETile. 
					tile updateSprite: sprite]]
			ifNotNil: [sprite
				ifNil: [
					self tileMap tileMatrixStack layer: layer at: y at: x put: nil.
					tile abandon]
				ifNotNil: [tile updateSprite: (aList at: coordinates)]]]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alex M 6/28/2024 02:45'
}
GMTEEditTilesCommand >> previousSprites [
	^ previousSprites
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alex M 6/28/2024 02:45'
}
GMTEEditTilesCommand >> previousSprites: anObject [
	previousSprites := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alex M 6/28/2024 02:56'
}
GMTEEditTilesCommand >> tileMap [
	^ tileMap
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alex M 6/28/2024 02:56'
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
