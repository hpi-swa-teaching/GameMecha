Class {
	#name : #GMTETilemapSizeCommand,
	#superclass : #GMTECommand,
	#instVars : [
		'editor',
		'method',
		'prevSize',
		'newSize',
		'savedTiles'
	],
	#category : #'GM-TE-CommandProcessor'
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
	#'squeak_changestamp' : 'Alex M 7/1/2024 18:52'
}
GMTETilemapSizeCommand >> do [

	self editor perform: self method with: self newSize.
	self restoreTiles
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
	#'squeak_changestamp' : 'Alex M 7/1/2024 18:23'
}
GMTETilemapSizeCommand >> restoreTiles [
]

{
	#category : #execution,
	#'squeak_changestamp' : 'Alex M 7/1/2024 18:52'
}
GMTETilemapSizeCommand >> undo [

	self editor perform: self method with: self prevSize.
	self restoreTiles
]
