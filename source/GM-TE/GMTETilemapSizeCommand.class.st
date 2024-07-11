Class {
	#name : #GMTETilemapSizeCommand,
	#superclass : #GMTEEditTilesCommand,
	#instVars : [
		'editor',
		'method',
		'prevSize',
		'newSize',
		'savedTiles'
	],
	#category : #'GM-TE-UI'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Alex M 7/1/2024 18:39'
}
GMTETilemapSizeCommand class >> prevValue: aNumber1 newValue: aNumber2 method: aSymbol editor: anEditor [

	^ (self new)
		
		prevSize: aNumber1;
		newSize: aNumber2;
		method: aSymbol;
		editor: anEditor
]

{
	#category : #execution,
	#'squeak_changestamp' : 'Alex M 7/2/2024 16:36'
}
GMTETilemapSizeCommand >> do [

	self editor perform: self method with: self newSize
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alex M 7/1/2024 18:00'
}
GMTETilemapSizeCommand >> editor [
	^ editor
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alex M 7/1/2024 18:00'
}
GMTETilemapSizeCommand >> editor: anObject [
	editor := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alex M 7/1/2024 18:48'
}
GMTETilemapSizeCommand >> method [
	^ method
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alex M 7/1/2024 18:48'
}
GMTETilemapSizeCommand >> method: anObject [
	method := anObject
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
	#category : #execution,
	#'squeak_changestamp' : 'Alex M 7/4/2024 01:06'
}
GMTETilemapSizeCommand >> restoreTiles [
	"TODO: Use function of tilemap"
	
	"currently done by Editor, needs to be implemented correctly"
]

{
	#category : #execution,
	#'squeak_changestamp' : 'Alex M 7/2/2024 17:22'
}
GMTETilemapSizeCommand >> undo [

	self editor perform: self method with: self prevSize.
	self restoreTiles
]
