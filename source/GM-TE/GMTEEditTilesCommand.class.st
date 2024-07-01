Class {
	#name : #GMTEEditTilesCommand,
	#superclass : #GMTECommand,
	#instVars : [
		'tileMap',
		'previousSprites',
		'currentSprites'
	],
	#category : #'GM-TE-CommandProcessor'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Alex M 6/28/2024 21:20'
}
GMTEEditTilesCommand class >> previousTiles: aDictionary1 currentTiles: aDictionary2 tilemap: aTileMap [

	^ (GMTEEditTilesCommand new)
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
	#'squeak_changestamp' : 'Alex M 7/1/2024 17:32'
}
GMTEEditTilesCommand >> do [
	| tile sprite layer x y |
	
	self currentSprites keysDo: [ :coordinates |
		x := coordinates at: 1.
		y := coordinates at: 2.
		layer := coordinates at: 3.
		
		tile := self tileMap tileMatrixStack layer: layer at: y at: x.
		sprite := self currentSprites at: coordinates.
		tile
			ifNil: [sprite ifNotNil: [tile := tileMap generateTileAtlayer: layer x: x y: y stack: self tileMap tileMatrixStack tileType: GMTETile.
					tile updateSprite: sprite]]
			ifNotNil: [sprite
				ifNil: [self tileMap tileMatrixStack layer: layer at: y at: x put: nil.
					tile abandon]
				ifNotNil: [tile updateSprite: (self currentSprites at: coordinates)]]]
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
	#'squeak_changestamp' : 'Alex M 7/1/2024 17:32'
}
GMTEEditTilesCommand >> undo [
	| tile sprite layer x y |
	
	self previousSprites keysDo: [ :coordinates |
		x := coordinates at: 1.
		y := coordinates at: 2.
		layer := coordinates at: 3.
		
		tile := self tileMap tileMatrixStack layer: layer at: y at: x.
		sprite := self previousSprites at: coordinates.
		tile
			ifNil: [sprite ifNotNil: [tile := tileMap generateTileAtlayer: layer x: x y: y stack: self tileMap tileMatrixStack tileType: GMTETile.
					tile updateSprite: sprite]]
			ifNotNil: [sprite
				ifNil: [self tileMap tileMatrixStack layer: layer at: y at: x put: nil.
					tile abandon]
				ifNotNil: [tile updateSprite: (self previousSprites at: coordinates)]]]
]
