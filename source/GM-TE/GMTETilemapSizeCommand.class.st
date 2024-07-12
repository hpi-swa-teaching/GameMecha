Class {
	#name : #GMTETilemapSizeCommand,
	#superclass : #GMTEEditTilesCommand,
	#instVars : [
		'prevSize',
		'newSize',
		'savedTiles'
	],
	#category : #'GM-TE-UI'
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
	#'squeak_changestamp' : 'Alex M 7/1/2024 18:16'
}
GMTETilemapSizeCommand >> newSize [
	^ newSize
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alex M 7/1/2024 18:16'
}
GMTETilemapSizeCommand >> newSize: anObject [
	newSize := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alex M 7/1/2024 18:16'
}
GMTETilemapSizeCommand >> prevSize [
	^ prevSize
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alex M 7/1/2024 18:16'
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
	#'squeak_changestamp' : 'Alex M 7/12/2024 20:12'
}
GMTETilemapSizeCommand >> saveTiles [

	self
		savedTiles: (self editor tileMap tileMatrixStack tileLossAfterRescaleToWidth: self newSize x height: self newSize y);
		tileMap: self editor tileMap
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alex M 7/12/2024 18:31'
}
GMTETilemapSizeCommand >> savedTiles [
	^ savedTiles
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alex M 7/12/2024 18:31'
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
