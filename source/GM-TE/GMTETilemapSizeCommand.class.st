"
Command that resizes the tilemap
"
Class {
	#name : #GMTETilemapSizeCommand,
	#superclass : #GMTEEditTilesCommand,
	#instVars : [
		'prevSize',
		'newSize',
		'savedTiles'
	],
	#category : 'GM-TE-Editor'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Alex M 7/12/2024 20:00'
}
GMTETilemapSizeCommand class >> prevSize: aPoint1 newSize: aPoint2 editor: anEditor [

	^ (self new)
		
		prevSize: aPoint1;
		newSize: aPoint2;
		editor: anEditor;
		saveTiles;
		yourself
]

{
	#category : #execution,
	#'squeak_changestamp' : 'Alex M 7/12/2024 19:41'
}
GMTETilemapSizeCommand >> do [

	self editor rescaleGridDimensions: self newSize
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alex M 7/12/2024 21:52'
}
GMTETilemapSizeCommand >> newSize [

	^ newSize
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alex M 7/12/2024 21:52'
}
GMTETilemapSizeCommand >> newSize: anObject [

	newSize := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alex M 7/12/2024 21:52'
}
GMTETilemapSizeCommand >> prevSize [

	^ prevSize
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alex M 7/12/2024 21:52'
}
GMTETilemapSizeCommand >> prevSize: anObject [

	prevSize := anObject
]

{
	#category : #restoring,
	#'squeak_changestamp' : 'Alex M 7/12/2024 18:57'
}
GMTETilemapSizeCommand >> restoreTiles [
	
	self placeTilesFromList: self savedTiles
]

{
	#category : #restoring,
	#'squeak_changestamp' : 'Alex M 7/12/2024 21:54'
}
GMTETilemapSizeCommand >> saveTiles [

	self
		tileMap: self editor tileMap;
		savedTiles: (self tileMap tileMatrixStack tileLossAfterRescaleToWidth: self newSize x height: self newSize y)
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alex M 7/12/2024 21:52'
}
GMTETilemapSizeCommand >> savedTiles [

	^ savedTiles
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alex M 7/12/2024 21:52'
}
GMTETilemapSizeCommand >> savedTiles: anObject [

	savedTiles := anObject
]

{
	#category : #execution,
	#'squeak_changestamp' : 'Alex M 7/12/2024 19:41'
}
GMTETilemapSizeCommand >> undo [

	self editor rescaleGridDimensions: self prevSize.
	self restoreTiles
]
